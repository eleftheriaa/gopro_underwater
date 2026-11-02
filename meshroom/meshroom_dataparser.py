"""Nerfstudio dataparser for Meshroom (AliceVision) SfM results.

Reads:
  - cameras.sfm  (JSON from the StructureFromMotion node)
  - sfm.ply      (sparse cloud you exported with ConvertSfMFormat)
  - images       (best: undistorted images from PrepareDenseScene, saved as jpg/png)

The sparse points go to metadata["points3D_xyz"] / ["points3D_rgb"], which
Splatfacto uses as its starting Gaussians.
"""
from __future__ import annotations

import json
from dataclasses import dataclass, field
from pathlib import Path
from typing import Literal, Optional, Tuple, Type

import numpy as np
import open3d as o3d
import torch

from nerfstudio.cameras import camera_utils
from nerfstudio.cameras.cameras import CameraType, Cameras
from nerfstudio.data.dataparsers.base_dataparser import (
    DataParser,
    DataParserConfig,
    DataparserOutputs,
)
from nerfstudio.data.scene_box import SceneBox
from nerfstudio.plugins.registry_dataparser import DataParserSpecification
from nerfstudio.utils.rich_utils import CONSOLE


@dataclass
class MeshroomDataParserConfig(DataParserConfig):
    """Meshroom dataparser configuration."""

    _target: Type = field(default_factory=lambda: MeshroomDataParser)
    data: Path = Path("data/meshroom")
    """Dataset folder. The paths below are relative to it (or absolute)."""
    sfm_file: Path = Path("cameras.sfm")
    ply_file: Path = Path("sfm.ply")
    images_dir: Path = Path("images")
    image_naming: Literal["auto", "view_id", "original"] = "auto"
    """auto: try <viewId>.<ext> and the original file name, with common extensions.
    view_id: files named <viewId>.<ext> (PrepareDenseScene output).
    original: use the file name stored in cameras.sfm."""
    image_ext: str = ".jpg"
    """Extension used when image_naming is view_id."""
    scale_factor: float = 1.0
    scene_scale: float = 1.0
    orientation_method: Literal["pca", "up", "vertical", "none"] = "up"
    center_method: Literal["poses", "focus", "none"] = "poses"
    auto_scale_poses: bool = True
    train_split_fraction: float = 0.9
    remove_outliers: bool = False
    """Statistical outlier removal on the sparse cloud (can cut thin branches)."""
    crop_min: Optional[Tuple[float, float, float]] = None
    crop_max: Optional[Tuple[float, float, float]] = None
    """Keep only sparse points inside this box. Values are in the original
    Meshroom coordinates (the same as in sfm.ply), before any orient/scale."""


class MeshroomDataParser(DataParser):
    config: MeshroomDataParserConfig

    def __init__(self, config: MeshroomDataParserConfig):
        super().__init__(config=config)
        self.data: Path = config.data

    def _p(self, p) -> Path:
        p = Path(p)
        return p if p.is_absolute() else Path(self.data) / p

    @staticmethod
    def _focal_px(intr: dict, w: int, h: int):
        if "pxFocalLength" in intr:
            v = intr["pxFocalLength"]
            if isinstance(v, list):
                return float(v[0]), float(v[1])
            return float(v), float(v)
        f = float(intr["focalLength"]) * max(w, h) / float(intr["sensorWidth"])
        return f, f

    def _find_image(self, view: dict, img_dir: Path):
        exts = [self.config.image_ext, ".png", ".jpg", ".jpeg", ".PNG", ".JPG"]
        orig = Path(view["path"])
        names = []
        mode = self.config.image_naming
        if mode in ("auto", "view_id"):
            names += [f"{view['viewId']}{e}" for e in exts]
        if mode in ("auto", "original"):
            names += [orig.name] + [f"{orig.stem}{e}" for e in exts]
        for n in names:
            if (img_dir / n).exists():
                return img_dir / n
        return None

    def _load_points(self, transform: torch.Tensor, scale: float):
        ply = self._p(self.config.ply_file)
        pcd = o3d.io.read_point_cloud(str(ply))
        if self.config.crop_min is not None and self.config.crop_max is not None:
            before = len(pcd.points)
            box = o3d.geometry.AxisAlignedBoundingBox(
                np.array(self.config.crop_min, dtype=np.float64),
                np.array(self.config.crop_max, dtype=np.float64),
            )
            pcd = pcd.crop(box)
            CONSOLE.log(f"Crop box kept {len(pcd.points)} of {before} points")
        if self.config.remove_outliers:
            pcd, _ = pcd.remove_statistical_outlier(nb_neighbors=20, std_ratio=3.0)
        xyz = torch.from_numpy(np.asarray(pcd.points, dtype=np.float32))
        if len(pcd.colors) == len(xyz) and len(xyz) > 0:
            rgb = np.asarray(pcd.colors) * 255.0
        else:
            CONSOLE.log("[yellow]PLY has no colors, using gray.")
            rgb = np.full((len(xyz), 3), 128.0)
        rgb = torch.from_numpy(rgb.astype(np.uint8))
        # same transform as the cameras: orient, center, then scale
        xyz = torch.cat([xyz, torch.ones_like(xyz[:, :1])], -1) @ transform.T
        xyz = xyz * scale
        CONSOLE.log(f"Loaded {len(xyz)} sparse points from {ply.name}")
        return {"points3D_xyz": xyz, "points3D_rgb": rgb}

    def _generate_dataparser_outputs(self, split="train", **kwargs):
        sfm_path = self._p(self.config.sfm_file)
        with open(sfm_path, "r") as f:
            sfm = json.load(f)

        intrinsics = {str(i["intrinsicId"]): i for i in sfm["intrinsics"]}

        poses_c2w = {}
        for p in sfm["poses"]:
            t = p["pose"]["transform"]
            R_c2w = np.array(t["rotation"], dtype=np.float64).reshape(3, 3)
            C = np.array(t["center"], dtype=np.float64)
            c2w = np.eye(4)
            # Verified on real data (diagnose_conventions.py): in this Meshroom
            # version the stored rotation is already camera-to-world.
            c2w[:3, :3] = R_c2w
            c2w[:3, 3] = C
            poses_c2w[str(p["poseId"])] = c2w

        img_dir = self._p(self.config.images_dir)
        rows = []
        n_missing = 0
        warned = False
        for v in sfm["views"]:
            pid = str(v["poseId"])
            if pid not in poses_c2w:
                continue  # view was not reconstructed
            path = self._find_image(v, img_dir)
            if path is None:
                n_missing += 1
                if n_missing <= 3:
                    CONSOLE.log(
                        f"[yellow]No image for viewId {v['viewId']} "
                        f"(original path: {v['path']})"
                    )
                continue
            intr = intrinsics[str(v["intrinsicId"])]
            w, h = int(intr["width"]), int(intr["height"])
            dist = [abs(float(x)) for x in intr.get("distortionParams", [])]
            if dist and max(dist) > 1e-6 and path.stem != str(v["viewId"]) and not warned:
                warned = True
                CONSOLE.log(
                    "[yellow]These look like original frames, but the camera has lens "
                    "distortion. This parser assumes no distortion. Use the undistorted "
                    "PrepareDenseScene images (png or jpg, named <viewId>)."
                )
            fx, fy = self._focal_px(intr, w, h)
            ppx, ppy = (float(x) for x in intr["principalPoint"])  # offset from center
            rows.append((path, poses_c2w[pid], fx, fy, w / 2 + ppx, h / 2 + ppy, w, h))

        if not rows:
            found = sorted(p.name for p in img_dir.glob("*"))[:5] if img_dir.exists() else "FOLDER DOES NOT EXIST"
            raise RuntimeError(
                f"No usable images found in {img_dir}. First files there: {found}. "
                f"{n_missing} views had no matching image."
            )
        rows.sort(key=lambda r: r[0].name)

        image_filenames = [r[0] for r in rows]
        poses = torch.from_numpy(np.stack([r[1] for r in rows]).astype(np.float32))
        # AliceVision/OpenCV camera axes (x right, y down, z forward) to OpenGL (y up, z back)
        poses[:, 0:3, 1:3] *= -1

        # split: evenly spaced eval images
        n = len(image_filenames)
        n_train = int(np.ceil(n * self.config.train_split_fraction))
        eval_idx = np.setdiff1d(np.arange(n), np.linspace(0, n - 1, n_train, dtype=int))
        train_idx = np.setdiff1d(np.arange(n), eval_idx)
        indices = train_idx if split == "train" else eval_idx
        if split != "train" and len(indices) == 0:
            indices = train_idx[:1]

        poses, transform = camera_utils.auto_orient_and_center_poses(
            poses,
            method=self.config.orientation_method,
            center_method=self.config.center_method,
        )
        scale = 1.0
        if self.config.auto_scale_poses:
            scale /= float(torch.max(torch.abs(poses[:, :3, 3])))
        scale *= self.config.scale_factor
        poses[:, :3, 3] *= scale

        idx = torch.tensor(indices, dtype=torch.long)
        col = lambda k: torch.tensor([r[k] for r in rows], dtype=torch.float32)[idx]
        cameras = Cameras(
            fx=col(2),
            fy=col(3),
            cx=col(4),
            cy=col(5),
            height=torch.tensor([r[7] for r in rows], dtype=torch.int32)[idx],
            width=torch.tensor([r[6] for r in rows], dtype=torch.int32)[idx],
            camera_to_worlds=poses[idx, :3, :4],
            camera_type=CameraType.PERSPECTIVE,
        )

        metadata = self._load_points(transform, scale)
        scene_box = SceneBox(
            aabb=torch.tensor([[-1.0, -1.0, -1.0], [1.0, 1.0, 1.0]]) * self.config.scene_scale
        )
        return DataparserOutputs(
            image_filenames=[image_filenames[i] for i in indices],
            cameras=cameras,
            scene_box=scene_box,
            dataparser_scale=scale,
            dataparser_transform=transform,
            metadata=metadata,
        )


MeshroomDataParserSpec = DataParserSpecification(config=MeshroomDataParserConfig())
