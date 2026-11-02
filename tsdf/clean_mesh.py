import json, numpy as np, open3d as o3d

MESH_IN, MESH_OUT = "seafree_coral_tsdf.ply", "seafree_coral_clean.ply"
roi = json.load(open("roi.json"))
center, R = np.array(roi["center"]), roi["R_ROI"]

RADIUS_SCALE = 3.0      # try 0.8 if tub is still there
PLANE_THR = 0.02 * R     # thickness of the "floor"
REMOVE_FLOOR = True

mesh = o3d.io.read_triangle_mesh(MESH_IN)
print("start:", len(mesh.vertices), "vertices")

# 1. keep a ball around the coral
v = np.asarray(mesh.vertices)
mesh.remove_vertices_by_mask(np.linalg.norm(v - center, axis=1) > RADIUS_SCALE * R)

# 2. remove the floor plane and everything below it
if REMOVE_FLOOR:
    v = np.asarray(mesh.vertices)
    pcd = o3d.geometry.PointCloud(o3d.utility.Vector3dVector(v))
    (a, b, c, d), inl = pcd.segment_plane(PLANE_THR, 3, 2000)
    n = np.array([a, b, c]); s = np.linalg.norm(n); n /= s; d /= s
    dist = v @ n + d
    rest = np.setdiff1d(np.arange(len(v)), inl)
    side = np.sign(np.median(dist[rest]))      # which side the coral is on
    mesh.remove_vertices_by_mask(side * dist < PLANE_THR)
    print("plane normal", n, "inliers", len(inl))

# 3. keep the largest connected piece
mesh.remove_degenerate_triangles()
mesh.remove_unreferenced_vertices()
idx, ntri, area = mesh.cluster_connected_triangles()
idx, area = np.asarray(idx), np.asarray(area)
mesh.remove_triangles_by_mask(idx != area.argmax())
mesh.remove_unreferenced_vertices()
mesh.compute_vertex_normals()
print("end:", len(mesh.vertices), "vertices")
o3d.io.write_triangle_mesh(MESH_OUT, mesh)
o3d.visualization.draw_geometries([mesh])