# Underwater Coral 3D Reconstruction: Photogrammetry vs Gaussian Splatting

Comparing photogrammetry and Gaussian splatting for underwater coral shape, using a structured light 3D scan as the reference.

> Status: work in progress. TODO: update the status line when the final results are ready.

## Goal

Corals are measured by their 3D shape: volume, surface area, and how rough the surface is. This project tests **how accurately photogrammetry and Gaussian splatting reconstruct coral shape and appearance underwater**, by comparing every reconstruction against a high precision 3D scan of the same coral.

Questions:

1. How close to the scan is each method, and where do the errors appear?
2. Does a water-aware Gaussian splatting method (SeaFree-GS) help compared with plain Splatfacto?
3. How much do the settings (training steps, densification threshold, TSDF voxel size) change the shape?

## Method overview

![Method diagram](docs/)

TODO: add the diagram image to `docs/method_diagram.png`.

1. **Capture** underwater photos with a GoPro in a water tank.
2. **Photogrammetry:** reconstruct a mesh with Meshroom.
3. **Gaussian splatting:** train Splatfacto and SeaFree-GS, then turn each splat into a mesh with TSDF fusion of its rendered depth images, and clean the mesh.
4. **Reference scan:** scan the coral with the EinScan 3D scanner.
5. **Comparison:** align every mesh to the scan and measure the error.

## Repository structure

TODO: paste the output of `tree /F` here and describe each folder and script in one line. Example:

```
tsdf_export.py        Render depth from a trained splat and fuse it into a mesh
<cleanup script>      Remove the tub and floaters from a mesh
compare_coral.py      Align meshes to the scan and compute the errors
configs/              Training configs of the reported runs
docs/                 Figures used in this README
```

## Setup

Tested on Windows. TODO: confirm the versions you used.

```
conda create -n coral python=3.10
conda activate coral
pip install nerfstudio open3d numpy scipy
```

TODO: replace with `conda env export --from-history > environment.yml` and write `conda env create -f environment.yml` here.

Other tools:

- Meshroom, for photogrammetry. TODO: version.
- COLMAP, for camera poses. TODO: version, and whether you used it or Meshroom's poses.
- CloudCompare, for looking at the error maps. Optional.
- A GPU with CUDA. TODO: your GPU and memory. Training was done on a GPU with 6 GB of memory, so image size and the number of Gaussians were kept small.

## Step by step

### 1. Capture

TODO: write your real settings. Recommended:

- GoPro in the narrowest field of view mode, with exposure and white balance locked.
- 100 to 150 sharp photos, several orbits at different heights, with high overlap.
- A scale bar or a known length in the scene.
- A plain background, with the coral fixed and the camera moving around it.

### 2. Photogrammetry with Meshroom

Run the default pipeline on the photos. Export the geometry mesh, as  `.ply`.

### 3. Camera poses for the splats

TODO: explain how the poses were made (COLMAP or Meshroom) and how they were passed to Nerfstudio, including the dataparser you wrote for Meshroom output.

### 4. Train the splats

Splatfacto:

```
ns-train splatfacto --data <dataset folder> --output-dir outputs/<name> <options>
```

TODO: write the exact command and the settings you changed. For example `densify_grad_thresh` (default 0.0008, TODO: value used) and the number of steps.

SeaFree-GS: TODO: how it was run, the version or commit of the code, and its license.

Each run saves a `config.yml` in its output folder. The configs of the reported runs are copied to `configs/`.

### 5. Mesh from the splat with TSDF

```
python tsdf_export.py
```

TODO: add the arguments, such as the path to the `config.yml`.

What the script does:

1. Loads the trained model and its training cameras.
2. Renders a depth map from each training camera.
3. Estimates the center of the camera orbit. This is the point closest to all the cameras' viewing lines, which is where the coral should be.
4. Sets a region of interest: radius `R_ROI` = 0.35 times the average camera distance.
5. Removes depth pixels that are almost transparent (accumulation below 0.8) or outside the window of one camera distance plus or minus `R_ROI`.
6. Fuses the depth maps into a TSDF volume with voxel size `R_ROI / 100` and truncation of 4 voxels.
7. Extracts a triangle mesh with marching cubes, and saves the center and radius in an ROI file.

The voxel size limits the detail. Branches thinner than a voxel can disappear, so test more than one voxel size.

### 6. Clean the mesh

TODO: name of the script. The same rules are used for every method:

1. Keep only the part inside a ball of radius `R_ROI` around the orbit center.
2. Find the biggest flat surface with RANSAC, which is the tub floor, and remove it and everything below it.
3. Keep only the largest connected piece.

The ROI file must come from the same run as the mesh, because the numbers depend on the coordinate frame of that run.

### 7. Reference scan

Scanner: Shining 3D EinScan. TODO: model (SE or SP), and your settings.

- Calibrate before the session.
- Scan in several orientations, and align the scans with global optimization.
- Export an **unwatertight** mesh in millimeters. Do not fill holes, and use little or no smoothing and simplification, since this mesh is the ground truth.
- The scan is made of the dry coral. Areas the scanner could not see, such as deep gaps, are holes in the reference.

### 8. Compare with the scan

```
python compare_coral.py --gt scan.ply --pred meshroom_clean.ply tsdf_splatfacto_clean.ply tsdf_seafree_clean.ply --names meshroom splatfacto seafree --taus 0.5 1 2 --out results
```

What the script does:

1. Samples points on each mesh, and normalizes each one by its center and average radius.
2. Tries four start rotations from the principal axes of the shapes, and optionally random ones with `--random_starts N`. Each candidate is scored in both directions, which prevents a false fit.
3. Refines with rigid ICP, then tries a scale refinement, which is kept only if the scale stays plausible.
4. Converts the result back to the scanner's units, so errors are in millimeters.
5. Measures the distance from points on each mesh to the surface of the other.

Outputs, per method, in `results/<name>/`:

| File | Meaning |
|---|---|
| `pred_aligned.ply` | Your mesh, moved into the scan's frame. Not otherwise changed. |
| `accuracy_errors.ply` | Points on your mesh, colored by distance to the scan. |
| `completeness_errors.ply` | Points on the scan, colored by distance to your mesh. |
| `results.json` | All numbers, the scale factor, the transform, and the settings. |

And in `results/`: `comparison.md` and `comparison.csv`, with one row per method.

Metrics:

- **Accuracy:** the distance from the predicted mesh to the scan. High error means the method built surface that the scan does not have.
- **Completeness:** the distance from the scan to the predicted mesh. High error means the method missed real surface.
- **Within a threshold:** the percentage of points closer than a distance, for example 1 mm. Accuracy percent and completeness percent are reported separately, plus their combination as an F-score.
- **Chamfer L1:** the two mean distances added together.
- Use the median and the 95th percentile along with the mean. The maximum and the Hausdorff distance depend on single stray points.

Check the scale factor against your scale bar. Fitting the scale to the scan cannot confirm the scale by itself.

To look at the errors, open `pred_aligned.ply` and the scan together in CloudCompare, and open the `*_errors.ply` files. Use the same color range for every method.

## Results

TODO: fill in after the final runs. Suggested content:

- A figure with the photo, the Meshroom mesh, the mesh from the splat, and the scan, from the same view.
- Error maps for each method, with the same color bar in millimeters.
- The table from `results/comparison.md`.

## Limitations

- TODO: number of corals. Results from a single coral do not show general behavior.
- The coral is dead and photographed in a tank, which is easier than live coral in the sea. There is no current, no moving polyps, and no flickering light.
- Holes in the scan count as errors on the accuracy side, so the error maps must be looked at, not only the averages.
- The TSDF voxel size limits thin branches.
- Fitting scale to the scan hides scale errors unless a scale bar is checked.
- The comparison covers the whole chain from photos to a cleaned mesh, so differences can come from the meshing and cleaning steps, not only from the reconstruction method.

## Reproducibility

- The configs of the reported runs are in `configs/`.
- The comparison script uses a fixed seed. Repeat it once to see how much the numbers move.
- TODO: list the versions of Nerfstudio, Open3D, Meshroom, and the GPU.

## Data

TODO: say where the photos, scans, and meshes are, or that they are not public. Check the rights before sharing anything from the museum or from other people's work.

## Acknowledgments and references

- Nerfstudio, for Splatfacto and the training framework.
- Meshroom (AliceVision), for photogrammetry.
- COLMAP, for Structure from Motion.
- Open3D and CloudCompare, for mesh processing and inspection.
- SeaFree-GS: "SeaFree-GS: Reconstructing Underwater 3D Scenes With True Appearances". TODO: add the full citation.
- Shining 3D EinScan, for the reference scans.
- TODO: advisor, lab, and museum, if they agree to be named.

## License

TODO: choose a license for your own code, for example MIT. Keep the licenses of any third party code you include.
