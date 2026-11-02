
from pathlib import Path

import numpy as np
import torch
from plyfile import PlyData, PlyElement

G:\elefth\coral\gopro_underwater\outputs\unnamed\seafree-gs\2026-10-14_101540\config.yml
# Existing trained SeaFree-GS checkpoint
CHECKPOINT = Path(
    r"G:\elefth\coral\gopro_underwater\outputs\unnamed"
    r"\seafree-gs\2026-10-14_101540\nerfstudio_models"
    r"\step-000009999.ckpt"
)

# Output file for SuperSplat
OUTPUT = Path(
    r"G:\elefth\coral\gopro_underwater\splats\seafree_coral.ply"
)


def main():
    print(f"Loading checkpoint: {CHECKPOINT}")

    checkpoint = torch.load(
        CHECKPOINT,
        map_location="cpu",
        weights_only=False,
    )

    state = checkpoint["pipeline"]

    def get_param(name):
        key = f"_model.gauss_params.{name}"
        if key not in state:
            raise KeyError(f"Missing checkpoint parameter: {key}")
        return state[key].detach().cpu().numpy()

    # Extract trained Gaussian parameters.
    means = get_param("means")
    scales = get_param("scales")       # Logarithmic scales
    quats = get_param("quats")         # Stored quaternion values
    opacities = get_param("opacities") # Opacity logits
    features_dc = get_param("features_dc")

    n = means.shape[0]
    print(f"Found {n:,} Gaussians")

    # This model was trained with SH degree 0.
    # The renderer applies sigmoid to features_dc.
    #
    # Standard 3DGS PLY stores SH DC coefficients, not RGB.
    # Convert sigmoid RGB back to DC coefficients:
    # rgb = sigmoid(features_dc)
    # rgb = SH_C0 * dc + 0.5
    # Therefore dc = (rgb - 0.5) / SH_C0.
    SH_C0 = 0.28209479177387814
    rgb = 1.0 / (1.0 + np.exp(-features_dc))
    dc = (rgb - 0.5) / SH_C0

    # Construct the standard 3DGS PLY vertex fields.
    # SuperSplat/3DGS convention: rot_0 is quaternion w.
    dtype_fields = [
        ("x", "f4"), ("y", "f4"), ("z", "f4"),
        ("nx", "f4"), ("ny", "f4"), ("nz", "f4"),
        ("f_dc_0", "f4"), ("f_dc_1", "f4"), ("f_dc_2", "f4"),
        ("opacity", "f4"),
        ("scale_0", "f4"), ("scale_1", "f4"), ("scale_2", "f4"),
        ("rot_0", "f4"), ("rot_1", "f4"),
        ("rot_2", "f4"), ("rot_3", "f4"),
    ]

    vertices = np.empty(n, dtype=dtype_fields)

    vertices["x"], vertices["y"], vertices["z"] = means.T
    vertices["nx"] = 0.0
    vertices["ny"] = 0.0
    vertices["nz"] = 0.0

    vertices["f_dc_0"] = dc[:, 0]
    vertices["f_dc_1"] = dc[:, 1]
    vertices["f_dc_2"] = dc[:, 2]

    vertices["opacity"] = opacities.reshape(-1)
    vertices["scale_0"], vertices["scale_1"], vertices["scale_2"] = scales.T

    # Nerfstudio Gaussian quaternions are typically wxyz.
    # The standard 3DGS PLY uses rot_0=w, rot_1=x, rot_2=y, rot_3=z.
    vertices["rot_0"] = quats[:, 0]
    vertices["rot_1"] = quats[:, 1]
    vertices["rot_2"] = quats[:, 2]
    vertices["rot_3"] = quats[:, 3]

    OUTPUT.parent.mkdir(parents=True, exist_ok=True)
    element = PlyElement.describe(vertices, "vertex")
    PlyData([element], text=False).write(str(OUTPUT))

    print(f"Export complete: {OUTPUT}")
    print(f"File size: {OUTPUT.stat().st_size / (1024**2):.2f} MB")


if __name__ == "__main__":
    main()
