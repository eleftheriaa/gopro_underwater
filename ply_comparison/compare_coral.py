"""
Compare a Gaussian splat mesh (unknown scale and orientation) with a scanner
ground truth mesh (real units, normally mm).

What is different from the thesis script
  1. The splat mesh has an arbitrary scale: it is normalised, then a guarded scale refinement is tried.
  2. The splat mesh has an arbitrary rotation, so several start rotations are tried.
  3. Each cloud is normalised on its own (centre and RMS radius). The final
     transform is mapped back, so all errors are reported in SCAN units (mm).
  4. Accuracy (splat -> scan) and completeness (scan -> splat) are reported
     separately, plus F-score at fixed thresholds.
  5. Distances go to the true mesh surface, not to sampled points, and are fast.
  6. Everything is saved: aligned mesh, error-coloured clouds, a json with settings.

Usage
    python compare_coral.py --gt scan.ply --pred splat_clean.ply --out results
    python compare_coral.py --gt scan.ply --pred splat_clean.ply --taus 0.5 1 2 --random_starts 100

Before running
  - Clean the splat mesh first (tub removed), and use the same cleaning for every method.
  - The scan should be in mm. Check the unit in your scanner software.
  - Choose --taus BEFORE you look at results, and keep them for every method.

Dependencies:  pip install open3d numpy scipy
"""
import argparse
import copy
import json
from pathlib import Path

import numpy as np
import open3d as o3d
from scipy.spatial.transform import Rotation as Rot


# ───────────────────────── loading and sampling ─────────────────────────

def load_mesh(path):
    m = o3d.io.read_triangle_mesh(str(path))
    if len(m.triangles) == 0:
        raise ValueError(f"{path}: no triangles (is this a point cloud?)")
    m.remove_degenerate_triangles()
    m.remove_unreferenced_vertices()
    return m


def sample(mesh, n):
    return mesh.sample_points_uniformly(number_of_points=n)


def transformed(geom, T):
    return copy.deepcopy(geom).transform(T)


# ───────────────────────── normalisation ─────────────────────────

def normalise_matrix(pcd):
    """4x4 matrix that moves the centroid to the origin and sets RMS radius to 1."""
    pts = np.asarray(pcd.points)
    c = pts.mean(0)
    s = np.sqrt(((pts - c) ** 2).sum(1).mean())
    N = np.eye(4)
    N[:3, :3] *= 1.0 / s
    N[:3, 3] = -c / s
    return N, c, s


# ───────────────────────── start rotations ─────────────────────────

def principal_axes(pcd):
    pts = np.asarray(pcd.points)
    _, V = np.linalg.eigh(np.cov(pts.T))
    V = V[:, ::-1].copy()          # largest axis first
    if np.linalg.det(V) < 0:
        V[:, 2] *= -1
    return V


def start_rotations(gt_s, pr_s, n_random, seed):
    Vg, Vr = principal_axes(gt_s), principal_axes(pr_s)
    rots = []
    for sx in (1, -1):
        for sy in (1, -1):
            rots.append(Vg @ np.diag([sx, sy, sx * sy]) @ Vr.T)   # 4 sign choices, det = +1
    if n_random > 0:
        rots += list(Rot.random(n_random, random_state=seed).as_matrix())
    return rots


# ───────────────────────── ICP ─────────────────────────
# Both clouds are normalised to RMS radius 1, so the true relative scale is close
# to 1. Point-to-point ICP with free scale can "cheat" by shrinking the splat to a
# point (every splat point is then near the scan: fitness 1, error 0). So:
#   - the rotation search and main fit use RIGID ICP,
#   - candidates are scored in BOTH directions (the cheat fails scan -> splat),
#   - a scale refinement is accepted only if the scale stays in a sane range.

SCALE_RANGE = (0.8, 1.25)


def scale_of(T):
    return float(np.linalg.det(T[:3, :3]) ** (1 / 3))


def run_icp(src, tgt, T0, thresholds, iters, with_scaling=False):
    T = T0
    est = o3d.pipelines.registration.TransformationEstimationPointToPoint(with_scaling=with_scaling)
    for thr in thresholds:
        r = o3d.pipelines.registration.registration_icp(
            src, tgt, thr, T, est,
            o3d.pipelines.registration.ICPConvergenceCriteria(max_iteration=iters))
        T = r.transformation
    return T


def sym_eval(src, tgt, T, thr):
    """Fitness and rmse in both directions; the score is the worse direction."""
    a = o3d.pipelines.registration.evaluate_registration(src, tgt, thr, T)
    b = o3d.pipelines.registration.evaluate_registration(tgt, src, thr, np.linalg.inv(T))
    return min(a.fitness, b.fitness), max(a.inlier_rmse, b.inlier_rmse)


def align(gt_n, pr_n, n_search, n_refine, n_random, seed, force):
    """Rotation search on small clouds, then refinement on medium clouds."""
    frac = min(1.0, n_search / len(gt_n.points))
    gt_s = gt_n.random_down_sample(frac)
    pr_s = pr_n.random_down_sample(frac)

    best = None
    for i, R0 in enumerate(start_rotations(gt_s, pr_s, n_random, seed)):
        T0 = np.eye(4)
        T0[:3, :3] = R0
        T = run_icp(pr_s, gt_s, T0, [0.3, 0.15, 0.08], 50)
        fit, rmse = sym_eval(pr_s, gt_s, T, 0.05)
        key = (round(fit, 3), -rmse)
        tag = f"start {i:3d}" if i >= 4 else f"axes   {i}"
        print(f"  {tag}: fitness {fit:.3f}  rmse {rmse:.4f}")
        if best is None or key > best[0]:
            best = (key, T)

    if best[0][0] < 0.3 and not force:
        raise RuntimeError(
            f"No start rotation gave a good overlap (best fitness {best[0][0]:.2f}). Usually the splat mesh "
            "still contains junk (tub, floor, floaters) that spoils the normalisation. Clean it, or try "
            "--random_starts 50. Use --force to continue anyway.")

    fr = min(1.0, n_refine / len(gt_n.points))
    gt_r, pr_r = gt_n.random_down_sample(fr), pr_n.random_down_sample(fr)
    T_rigid = run_icp(pr_r, gt_r, best[1], [0.1, 0.05, 0.025, 0.012], 100)
    fit_r, rmse_r = sym_eval(pr_r, gt_r, T_rigid, 0.025)
    print(f"  rigid fit : fitness {fit_r:.3f}  rmse {rmse_r:.4f}")

    T_sc = run_icp(pr_r, gt_r, T_rigid, [0.05, 0.025, 0.012], 100, with_scaling=True)
    fit_s, rmse_s = sym_eval(pr_r, gt_r, T_sc, 0.025)
    sc = scale_of(T_sc)
    ok = SCALE_RANGE[0] < sc < SCALE_RANGE[1] and fit_s >= fit_r - 0.02 and rmse_s <= rmse_r
    print(f"  with scale: fitness {fit_s:.3f}  rmse {rmse_s:.4f}  extra scale {sc:.4f}  -> {'accepted' if ok else 'rejected'}")
    return (T_sc, fit_s, rmse_s) if ok else (T_rigid, fit_r, rmse_r)


# ───────────────────────── distances and metrics ─────────────────────────

def dist_to_mesh(points, mesh):
    """Distance from each point to the nearest point on the mesh surface."""
    scene = o3d.t.geometry.RaycastingScene()
    scene.add_triangles(o3d.t.geometry.TriangleMesh.from_legacy(mesh))
    q = o3d.core.Tensor(np.asarray(points, dtype=np.float32))
    return scene.compute_distance(q).numpy()


def stats(d):
    return {"mean": float(d.mean()), "median": float(np.median(d)),
            "p90": float(np.percentile(d, 90)), "p95": float(np.percentile(d, 95)),
            "rms": float(np.sqrt((d ** 2).mean())), "max": float(d.max())}


def error_colours(d, vmax):
    t = np.clip(d / vmax, 0, 1)[:, None]
    return np.hstack([t, 1 - np.abs(2 * t - 1), 1 - t])      # blue -> green -> red


def save_cloud(points, d, vmax, path):
    p = o3d.geometry.PointCloud(o3d.utility.Vector3dVector(points))
    p.colors = o3d.utility.Vector3dVector(error_colours(d, vmax))
    o3d.io.write_point_cloud(str(path), p)


# ───────────────────────── main ─────────────────────────

def main():
    ap = argparse.ArgumentParser(description="Splat mesh vs scanner ground truth.")
    ap.add_argument("--gt", required=True, help="scan mesh (real units, mm)")
    ap.add_argument("--pred", required=True, help="cleaned splat mesh (any scale)")
    ap.add_argument("--out", default="results", help="output folder")
    ap.add_argument("--num_points", type=int, default=500_000, help="samples per mesh")
    ap.add_argument("--n_search", type=int, default=20_000, help="points for the rotation search")
    ap.add_argument("--n_refine", type=int, default=100_000, help="points for the final ICP refinement")
    ap.add_argument("--force", action="store_true", help="continue even if the rotation search fails")
    ap.add_argument("--random_starts", type=int, default=0, help="extra random start rotations")
    ap.add_argument("--taus", type=float, nargs="+", default=[0.5, 1.0, 2.0],
                    help="F-score thresholds in scan units; choose before looking at results")
    ap.add_argument("--seed", type=int, default=0)
    args = ap.parse_args()

    np.random.seed(args.seed)
    try:
        o3d.utility.random.seed(args.seed)
    except AttributeError:
        pass
    out = Path(args.out)
    out.mkdir(parents=True, exist_ok=True)

    print("\n-- loading --")
    gt_mesh, pr_mesh = load_mesh(args.gt), load_mesh(args.pred)
    print(f"  scan : {len(gt_mesh.vertices)} vertices, {len(gt_mesh.triangles)} triangles")
    print(f"  splat: {len(pr_mesh.vertices)} vertices, {len(pr_mesh.triangles)} triangles")

    print("\n-- normalising and aligning --")
    gt_big, pr_big = sample(gt_mesh, args.num_points), sample(pr_mesh, args.num_points)
    Ng, _, s_gt = normalise_matrix(gt_big)
    Nr, _, _ = normalise_matrix(pr_big)
    gt_n, pr_n = transformed(gt_big, Ng), transformed(pr_big, Nr)

    T, fit, rmse_n = align(gt_n, pr_n, args.n_search, args.n_refine, args.random_starts, args.seed, args.force)
    total = np.linalg.inv(Ng) @ T @ Nr                       # splat units -> scan units
    scale = float(np.linalg.det(total[:3, :3]) ** (1 / 3))
    print(f"  splat -> scan scale factor: {scale:.5f}   <- compare with your scale bar")
    if fit < 0.5:
        print("  WARNING: low overlap. Look at the aligned mesh before trusting any number.")

    print("\n-- metrics (scan units) --")
    pr_aligned = copy.deepcopy(pr_mesh).transform(total)
    pr_aligned.compute_vertex_normals()
    o3d.io.write_triangle_mesh(str(out / "splat_aligned.ply"), pr_aligned)

    a_pts = np.asarray(sample(pr_aligned, args.num_points).points)    # splat samples
    g_pts = np.asarray(sample(gt_mesh, args.num_points).points)       # scan samples
    acc = dist_to_mesh(a_pts, gt_mesh)                                # splat -> scan
    comp = dist_to_mesh(g_pts, pr_aligned)                            # scan -> splat

    max_r = np.linalg.norm(g_pts - g_pts.mean(0), axis=1).max()       # thesis normalisation
    res = {
        "args": vars(args),
        "scale_splat_to_scan": scale,
        "transform_splat_to_scan": total.tolist(),
        "icp_fitness": float(fit), "icp_rmse_norm": float(rmse_n),
        "accuracy": stats(acc), "completeness": stats(comp),
        "chamfer_l1_sym": float(acc.mean() + comp.mean()),
        "chamfer_l1_sym_thesis_norm": float((acc.mean() + comp.mean()) / max_r),
        "hausdorff": float(max(acc.max(), comp.max())),
        "fscore": {},
    }
    for tau in args.taus:
        p, r = float((acc < tau).mean()), float((comp < tau).mean())
        res["fscore"][str(tau)] = {"precision": p, "recall": r,
                                   "f": 2 * p * r / (p + r) if p + r > 0 else 0.0}

    vmax = max(res["accuracy"]["p95"], 1e-9)
    save_cloud(a_pts, acc, vmax, out / "accuracy_errors.ply")
    save_cloud(g_pts, comp, vmax, out / "completeness_errors.ply")
    json.dump(res, open(out / "results.json", "w"), indent=2)

    print(f"  accuracy    (splat->scan): mean {res['accuracy']['mean']:.3f}  median {res['accuracy']['median']:.3f}  p95 {res['accuracy']['p95']:.3f}")
    print(f"  completeness (scan->splat): mean {res['completeness']['mean']:.3f}  median {res['completeness']['median']:.3f}  p95 {res['completeness']['p95']:.3f}")
    print(f"  Chamfer L1 symmetric: {res['chamfer_l1_sym']:.3f}  (thesis-normalised: {res['chamfer_l1_sym_thesis_norm']:.5f})")
    print(f"  Hausdorff: {res['hausdorff']:.3f}   (very sensitive to outliers, prefer p95)")
    for tau, v in res["fscore"].items():
        print(f"  F-score @ {tau}: {v['f']:.3f}  (precision {v['precision']:.3f}, recall {v['recall']:.3f})")
    print(f"\n  saved to {out.resolve()}")
    print("  Open accuracy_errors.ply and completeness_errors.ply in CloudCompare to see where the errors are.")
    print("  Scan holes show up as large accuracy errors, so always look at the maps.")


if __name__ == "__main__":
    main()
