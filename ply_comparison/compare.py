import numpy as np, open3d as o3d
gt  = o3d.io.read_triangle_mesh("EXSCAN.ply")
rec = o3d.io.read_triangle_mesh("coral_clean.ply")

ext = lambda m: np.linalg.norm(m.get_axis_aligned_bounding_box().get_extent())
rec.scale(ext(gt) / ext(rec), center=rec.get_center())      # rough scale
rec.translate(gt.get_center() - rec.get_center())           # rough position

voxel = ext(gt) / 50
def prep(m):
    p = m.sample_points_uniformly(200_000).voxel_down_sample(voxel)
    p.estimate_normals(o3d.geometry.KDTreeSearchParamHybrid(radius=voxel*2, max_nn=30))
    f = o3d.pipelines.registration.compute_fpfh_feature(
        p, o3d.geometry.KDTreeSearchParamHybrid(radius=voxel*5, max_nn=100))
    return p, f
src, fs = prep(rec); dst, fd = prep(gt)

res = o3d.pipelines.registration.registration_ransac_based_on_feature_matching(
    src, dst, fs, fd, True, voxel*1.5,
    o3d.pipelines.registration.TransformationEstimationPointToPoint(False), 3,
    [o3d.pipelines.registration.CorrespondenceCheckerBasedOnEdgeLength(0.9),
     o3d.pipelines.registration.CorrespondenceCheckerBasedOnDistance(voxel*1.5)],
    o3d.pipelines.registration.RANSACConvergenceCriteria(1_000_000, 0.999))
print("fitness", res.fitness, "rmse", res.inlier_rmse)
rec.transform(res.transformation)
o3d.io.write_triangle_mesh("splat_rough.ply", rec)