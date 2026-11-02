"""Find which pose convention matches cameras.sfm + sfm.ply, using point colors.

For each possible convention it projects the colored sparse points into a few
images and compares the point color with the image color at that pixel.
The correct convention gives a clearly lower error than the others and
than the random baseline. Needs a PLY with colors.
Edit the three paths below.
"""
import json
from pathlib import Path

import numpy as np
import open3d as o3d
from PIL import Image

root = Path(r"G:\\elefth\\coral\\gopro_underwater")
SFM = root / "meshroom" / "cameras.sfm"
PLY = root / "meshroom" / "sfm.ply"
IMAGES = root  / "images"
N_IMAGES = 8
N_POINTS = 5000

rng = np.random.default_rng(0)
sfm = json.load(open(SFM))
pcd = o3d.io.read_point_cloud(str(PLY))
P = np.asarray(pcd.points, dtype=np.float64)
COL = np.asarray(pcd.colors, dtype=np.float64) * 255.0
if len(COL) != len(P):
    raise SystemExit("The PLY has no colors, this test needs them.")
print(f"{len(P)} points, PLY range min={P.min(0).round(2)} max={P.max(0).round(2)}")

intr = {str(i["intrinsicId"]): i for i in sfm["intrinsics"]}
poses = {}
for p in sfm["poses"]:
    t = p["pose"]["transform"]
    poses[str(p["poseId"])] = (
        np.array(t["rotation"], dtype=float).reshape(3, 3),
        np.array(t["center"], dtype=float),
    )


def focal(i, w, h):
    if "pxFocalLength" in i:
        v = i["pxFocalLength"]
        return (float(v[0]), float(v[1])) if isinstance(v, list) else (float(v), float(v))
    f = float(i["focalLength"]) * max(w, h) / float(i["sensorWidth"])
    return f, f


def find_image(v):
    orig = Path(v["path"])
    names = [f"{v['viewId']}{e}" for e in (".png", ".jpg", ".jpeg")]
    names += [orig.name] + [orig.stem + e for e in (".png", ".jpg", ".jpeg")]
    for n in names:
        if (IMAGES / n).exists():
            return IMAGES / n
    return None


views = []
for v in sfm["views"]:
    if str(v["poseId"]) in poses:
        img = find_image(v)
        if img is not None:
            views.append((v, img))
print(f"{len(views)} views with a pose and an image")
if not views:
    raise SystemExit("No images found, check IMAGES.")
views = [views[i] for i in np.linspace(0, len(views) - 1, min(N_IMAGES, len(views)), dtype=int)]

v0, img0 = views[0]
i0 = intr[str(v0["intrinsicId"])]
print("first image:", img0.name)
print("intrinsics:", {k: i0[k] for k in i0 if k in
      ("type", "width", "height", "pxFocalLength", "focalLength", "sensorWidth",
       "principalPoint", "distortionParams")})

FLIPS = {"opencv axes": np.diag([1.0, 1.0, 1.0]), "flip y,z": np.diag([1.0, -1.0, -1.0])}


def variants(R, C):
    out = {}
    for rn, Rm in (("R", R), ("R.T", R.T)):
        out[f"{rn}, x=R(X-C)"] = (Rm, -Rm @ C)
        out[f"{rn}, x=R X + C"] = (Rm, C)
    return out


errs, valid = {}, {}
base = []
for v, path in views:
    i = intr[str(v["intrinsicId"])]
    w, h = int(float(i["width"])), int(float(i["height"]))
    fx, fy = focal(i, w, h)
    ppx, ppy = (float(x) for x in i["principalPoint"])
    cx, cy = w / 2 + ppx, h / 2 + ppy
    arr = np.asarray(Image.open(path).convert("RGB"))
    ah, aw = arr.shape[:2]
    if (aw, ah) != (w, h):
        print(f"note: {path.name} is {aw}x{ah}, intrinsics say {w}x{h}; scaling")
    R, C = poses[str(v["poseId"])]
    sel = rng.choice(len(P), min(N_POINTS, len(P)), replace=False)
    Ps, Cs = P[sel], COL[sel]

    # baseline: colors at random pixels
    ru = rng.integers(0, aw, len(sel))
    rv = rng.integers(0, ah, len(sel))
    base.append(np.abs(arr[rv, ru].astype(float) - Cs).mean(1))

    for vn, (Rm, t) in variants(R, C).items():
        for fn, F in FLIPS.items():
            Xc = (Ps @ Rm.T + t) @ F.T
            ok = Xc[:, 2] > 1e-6
            u = (fx * Xc[ok, 0] / Xc[ok, 2] + cx) * aw / w
            vv = (fy * Xc[ok, 1] / Xc[ok, 2] + cy) * ah / h
            inb = (u >= 0) & (u < aw - 1) & (vv >= 0) & (vv < ah - 1)
            if inb.sum() == 0:
                continue
            px = arr[vv[inb].astype(int), u[inb].astype(int)].astype(float)
            e = np.abs(px - Cs[ok][inb]).mean(1)
            key = f"{vn} | {fn}"
            errs.setdefault(key, []).append(e)
            valid.setdefault(key, []).append(inb.sum() / len(sel))

baseline = float(np.median(np.concatenate(base)))
print(f"\nrandom baseline color error: {baseline:.1f}\n")
rows = [(float(np.median(np.concatenate(e))), float(np.mean(valid[k])), k) for k, e in errs.items()]
for score, vfrac, k in sorted(rows):
    print(f"{score:6.1f}   {vfrac * 100:5.1f}% of points inside   {k}")
print("\nLower is better. A clear winner far below the baseline is the right convention.")
