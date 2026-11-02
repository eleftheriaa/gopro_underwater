from plyfile import PlyData

import numpy as np
plydata = PlyData.read("G:\elefth\coral\gopro_underwater\splats\seafree_coral.ply")
vertices = plydata["vertex"]

points = np.column_stack([
    vertices["x"],
    vertices["y"],
    vertices["z"]
]).astype(np.float32)

sphere_center = np.array([0.05, 0.01, -0.13])

radius = 0.3

distances = np.linalg.norm(
    points - sphere_center,
    axis=1
)

mask = distances <= radius

print("PLY vertices:", len(points))
print("Inside sphere:", np.sum(mask))
print("Outside sphere:", np.sum(~mask))

import matplotlib.pyplot as plt

inside = points[mask]
outside = points[~mask]

fig = plt.figure(figsize=(12, 10))
ax = fig.add_subplot(111, projection="3d")

ax.scatter(
    inside[:, 0],
    inside[:, 1],
    inside[:, 2],
    s=2,
    alpha=0.5,
    label="Inside sphere"
)

ax.scatter(
    outside[:, 0],
    outside[:, 1],
    outside[:, 2],
    s=2,
    alpha=0.05,
    label="Outside sphere"
)

ax.set_xlabel("X")
ax.set_ylabel("Y")
ax.set_zlabel("Z")

ax.set_title(
    f"Sphere filtering — radius = {radius}"
)

ax.legend()

plt.show()

import numpy as np
from plyfile import PlyData, PlyElement

# ============================================================
# 1. LOAD PLY
# ============================================================

input_ply = "G:\elefth\coral\gopro_underwater\splats\seafree_coral.ply"
output_ply = "G:\elefth\coral\gopro_underwater\splats\\seafree_coral_sphere.ply"

plydata = PlyData.read(input_ply)

vertices = plydata["vertex"]

points = np.column_stack([
    vertices["x"],
    vertices["y"],
    vertices["z"]
]).astype(np.float32)

print("Original PLY vertices:", len(points))



# ============================================================
# 3. KEEP POINTS INSIDE SPHERE
# ============================================================

distances = np.linalg.norm(
    points - sphere_center,
    axis=1
)

mask = distances <= radius

filtered_vertices = vertices.data[mask]

print("Points inside sphere:", len(filtered_vertices))
print("Points removed:", np.sum(~mask))


# ============================================================
# 4. CREATE NEW PLY
# ============================================================

vertex_element = PlyElement.describe(
    filtered_vertices,
    "vertex"
)

PlyData(
    [vertex_element],
    text=False
).write(output_ply)

print("\nSaved:")
print(output_ply)