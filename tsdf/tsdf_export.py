import numpy as np, torch, open3d as o3d
from pathlib import Path
from nerfstudio.utils.eval_utils import eval_setup

config, pipeline, _, _ = eval_setup(Path("G:/elefth/coral/gopro_underwater/outputs/unnamed/seafree-gs/2026-10-14_101540/config.yml"))
model = pipeline.model
cams = pipeline.datamanager.train_dataset.cameras

VOXEL = 0.003   # choose from the coral size, see below


flip = np.diag([1, -1, -1, 1])   # Nerfstudio camera axes -> Open3D axes
means = model.means.detach().cpu().numpy()
lo, hi = np.percentile(means, 2, axis=0), np.percentile(means, 98, axis=0)
# extent = float((hi - lo).max())
center = means[(means > lo).all(1) & (means < hi).all(1)].mean(0)

cam_pos = cams.camera_to_worlds[:, :3, 3].cpu().numpy()
cam_dist = np.linalg.norm(cam_pos - center, axis=1)

c2w_all = cams.camera_to_worlds.cpu().numpy()      # N x 3 x 4
pos = c2w_all[:, :, 3]
fwd = -c2w_all[:, :, 2]                            # cameras look down -z

# point closest to all optical axes = center of the orbit
A = np.zeros((3, 3)); b = np.zeros(3)
for p, d in zip(pos, fwd):
    d = d / np.linalg.norm(d)
    M = np.eye(3) - np.outer(d, d)
    A += M; b += M @ p
center = np.linalg.solve(A, b)

cam_d = np.linalg.norm(pos - center, axis=1)       # camera distance to coral
R_ROI = 0.35 * cam_d.mean()  
import json
json.dump({"center": center.tolist(), "R_ROI": float(R_ROI)}, open("tsdf/roi.json", "w"))                      # guess: coral radius, adjust
VOXEL = R_ROI / 100
SDF_TRUNC = 4 * VOXEL
volume = o3d.pipelines.integration.ScalableTSDFVolume(
    voxel_length=VOXEL, sdf_trunc=SDF_TRUNC,
    color_type=o3d.pipelines.integration.TSDFVolumeColorType.NoColor)
print("cam dist", cam_d.mean(), "R_ROI", R_ROI, "voxel", VOXEL)
depth_trunc=float((cam_d + R_ROI).max())

for i in range(len(cams)):
    cam = cams[i:i+1].to(model.device)
    with torch.no_grad():
        out = model.get_outputs_for_camera(cam)

    

    depth = out["depth"].squeeze().cpu().numpy().astype(np.float32)
    rgb = (out["rgb"].clamp(0, 1).cpu().numpy() * 255).astype(np.uint8)
    alpha = out["accumulation"].squeeze().cpu().numpy()
    depth[alpha < 0.8] = 0          # drop empty or floaty pixels

    h, w = depth.shape
    intr = o3d.camera.PinholeCameraIntrinsic(
        w, h, float(cam.fx), float(cam.fy), float(cam.cx), float(cam.cy))

    c2w = np.eye(4)
    c2w[:3, :4] = cam.camera_to_worlds[0].cpu().numpy()
    w2c = np.linalg.inv(c2w @ flip)

    depth = np.nan_to_num(depth, nan=0.0, posinf=0.0, neginf=0.0)
    depth[alpha < 0.8] = 0
    depth[(depth < cam_d[i] - R_ROI) | (depth > cam_d[i] + R_ROI)] = 0
    print(i, "valid pixels", int((depth > 0).sum()))
    if (depth > 0).sum() < 100:
        continue

    rgbd = o3d.geometry.RGBDImage.create_from_color_and_depth(
        o3d.geometry.Image(rgb), o3d.geometry.Image(depth),
        depth_scale=1.0, depth_trunc=10.0, convert_rgb_to_intensity=False)
    volume.integrate(rgbd, intr, w2c)

mesh = volume.extract_triangle_mesh()
mesh.compute_vertex_normals()
o3d.io.write_triangle_mesh("coral_tsdf.ply", mesh)