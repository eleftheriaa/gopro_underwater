import numpy as np
import open3d as o3d

p = np.asarray(o3d.io.read_point_cloud(r"G:\elefth\coral\gopro_underwater\meshroom\sfm.ply").points)

lo = np.array([-0.5, -0.3, 1.2])   # your current crop_min
hi = np.array([ 0.4,  0.6, 2.4])   # your current crop_max
center, half = (lo + hi) / 2, (hi - lo) / 2

for s in (1.0, 1.25, 1.5, 2.0, 2.5, 3.0):
    a, b = center - half * s, center + half * s
    n = int(np.all((p >= a) & (p <= b), axis=1).sum())
    print(f"scale {s}: {n} points  min={a.round(2)}  max={b.round(2)}")