"""Check the Meshroom dataparser: draw the sparse points on the training images.

It uses the real parser output (poses, intrinsics, points after orient/scale),
so if the points land on the coral here, the parser is doing its job.
Edit the config below to match your training run.
"""
from pathlib import Path

import numpy as np
from PIL import Image, ImageDraw

from meshroom_dataparser import MeshroomDataParserConfig

root = Path(r"G:\\elefth\\coral\\gopro_underwater")

config = MeshroomDataParserConfig(
    data=root,
    sfm_file=root/ "meshroom" /  "cameras.sfm",
    ply_file=root/ "meshroom" / "sfm.ply",
    images_dir=root/ "images",
    image_naming="original",      # use "original" if these are your raw GoPro photos
    image_ext=".png",
    orientation_method="none",
    center_method="none",
    auto_scale_poses=False,
    # crop_min=(...), crop_max=(...),
)

out = config.setup().get_dataparser_outputs(split="train")
cams = out.cameras
c2w = cams.camera_to_worlds.numpy()  # N x 3 x 4, OpenGL convention
pts = out.metadata["points3D_xyz"].numpy()
print(f"{len(c2w)} cameras, {len(pts)} points")

save_dir = root / "reproj_check"
save_dir.mkdir(exist_ok=True)
rng = np.random.default_rng(0)

for i in np.linspace(0, len(c2w) - 1, 6, dtype=int):
    R, t = c2w[i, :, :3], c2w[i, :, 3]
    pc = (pts - t) @ R  # world to camera: R^T (X - t)
    pc = pc[pc[:, 2] < 0]  # OpenGL cameras look down -z
    fx, fy = float(cams.fx[i]), float(cams.fy[i])
    cx, cy = float(cams.cx[i]), float(cams.cy[i])
    u = fx * pc[:, 0] / -pc[:, 2] + cx
    v = cy - fy * pc[:, 1] / -pc[:, 2]

    img = Image.open(out.image_filenames[i]).convert("RGB")
    cw, ch = int(cams.width[i]), int(cams.height[i])
    if img.size != (cw, ch):
        print(f"WARNING image {out.image_filenames[i].name}: file is {img.size}, intrinsics say {(cw, ch)}")
    ok = (u >= 0) & (u < img.size[0]) & (v >= 0) & (v < img.size[1])
    u, v = u[ok], v[ok]
    if len(u) > 3000:
        keep = rng.choice(len(u), 3000, replace=False)
        u, v = u[keep], v[keep]
    d = ImageDraw.Draw(img)
    for x, y in zip(u, v):
        d.ellipse([x - 2, y - 2, x + 2, y + 2], outline=(255, 0, 0))
    name = save_dir / f"check_{i:04d}.jpg"
    img.save(name)
    print(f"saved {name}  ({ok.sum()} points inside the image)")