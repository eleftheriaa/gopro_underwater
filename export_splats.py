import numpy as np
import torch
import yaml
from pathlib import Path
from nerfstudio.data.scene_box import OrientedBox
from nerfstudio.scripts.exporter import ExportGaussianSplat


config_file = Path("G:\elefth\coral\gopro_underwater\outputs\coral_underwater\seafree-gs\\2026-10-14_103808\config.yml")
print("Looking for:", config_file)
print("Absolute path:", config_file.resolve())
print("Exists:", config_file.exists())
config = yaml.load(config_file.read_text(), Loader=yaml.Loader)   
# config.load_dir = Path("gaussian/outputs/All_faces_sculpted_derivatives_90_1920x1080_relief_heightmap_1_all_cylinder.obj/splatfacto/nerfstudio_models")
# config.load_step = None
config.print_to_terminal()    

trainer = config.setup(local_rank=0, world_size=1)
trainer.setup()

pipeline = trainer.pipeline
# --- Compute object center from training cameras ---
cameras = trainer.pipeline.datamanager.train_dataset.cameras
positions    = cameras.camera_to_worlds[:, :3, 3].numpy()
forward_dirs = -cameras.camera_to_worlds[:, :3, 2].numpy()
dots         = np.sum(-positions * forward_dirs, axis=1, keepdims=True)
closest_pts  = positions + dots * forward_dirs
object_center = closest_pts.mean(axis=0) 
print(f"Object center: {object_center}")

obb_center   =  [0.26, 2.54,-1.54]     # (cx, cy, cz)
obb_rotation = (0.0, 0.0, 0.0)                              # no rotation (RPY = 0)
obb_scale    = tuple(float(v) for v in  [2.5,2.5,2.5]  )     # full extent = (2.0, 2.0, 2.0)


# ------------------------------------------------------------
# Estimate coral center from intersection of camera rays
# ------------------------------------------------------------

cameras = trainer.pipeline.datamanager.train_dataset.cameras

camera_positions = (
    cameras.camera_to_worlds[:, :3, 3]
    .detach()
    .cpu()
    .numpy()
)


# --- Run the exporter ---
exporter = ExportGaussianSplat(
    output_filename= "coral_seafree-gs.ply",
    load_config=trainer.config.get_base_dir() / "config.yml",
    output_dir=Path("G:\elefth\coral\gopro_underwater\splats"),
   # obb_center=obb_center,
    #obb_rotation=obb_rotation,
    #obb_scale=obb_scale, 
    ply_color_mode = "sh_coeffs",
)
exporter.main()
print("Export complete! saved to:", exporter.output_dir)