import sqlite3
import numpy as np
import cv2
import os
import matplotlib.pyplot as plt
import shutil

PAIR_ID_MULTIPLIER = 2147483647


def read_blob(blob, dtype):
    if isinstance(blob, memoryview):
        blob = blob.tobytes()
    return np.frombuffer(blob, dtype=dtype)

def pair_id_to_image_ids(pair_id):
    image_id2 = pair_id % PAIR_ID_MULTIPLIER
    image_id1 = (pair_id - image_id2) // PAIR_ID_MULTIPLIER
    return image_id1, image_id2


def load_keypoints(cur):
    cur.execute("SELECT image_id, rows, cols, data FROM keypoints;")
    keypoints_data = cur.fetchall()

    kpt_dict = {
        image_id: read_blob(data, np.float32).reshape(rows, cols)
        for image_id, rows, cols, data in keypoints_data
    }

    print(f"[INFO] Loaded {len(kpt_dict)} keypoint sets")
    return kpt_dict

def load_images(cur):
    cur.execute("SELECT image_id, name FROM images;")
    images = cur.fetchall()
    return images

def load_matches(cur):

    cur.execute("""
        SELECT pair_id, rows, cols, data
        FROM two_view_geometries;
    """)

    pairs = []

    for pair_id, rows, cols, data in cur.fetchall():

        if rows == 0:
            continue

        matches = read_blob(data, np.uint32).reshape(rows, cols)

        image_id1, image_id2 = pair_id_to_image_ids(pair_id)

        pairs.append((image_id1, image_id2, matches))

    return pairs


def visualize_keypoints_on_images(image_dir, db_path, out_dir="debug/keypoints"):
    """
    Visualize COLMAP keypoints on images and save results.
    """

    os.makedirs(out_dir, exist_ok=True)

    kp_size = 2
    kp_color = (0, 255, 0)  # green (BGR)

    conn = sqlite3.connect(db_path)
    cur = conn.cursor()

    # -----------------------------
    # Load images
    # -----------------------------
    images = load_images(cur)

    # -----------------------------
    # Load keypoints
    # -----------------------------
    kpt_dict = load_keypoints(cur)

    # -----------------------------
    # Process images
    # -----------------------------
    for image_id, name in images:

        img_path = os.path.join(image_dir, name)
        img = cv2.imread(img_path)

        if img is None:
            print(f"[SKIP] Missing image: {img_path}")
            continue

        if image_id not in kpt_dict:
            print(f"[SKIP] No keypoints for image_id {image_id}")
            continue

        kpts = kpt_dict[image_id]
        pts = kpts[:, :2].astype(np.int32)
        
        K = 400
        pts = pts[:K]


        print(f"[INFO] {name} -> {kpts.shape}")

        # -----------------------------
        # Draw keypoints
        # -----------------------------
        img_vis = img.copy()

        for x, y in pts:
            cv2.circle(img_vis, (x, y), kp_size, kp_color, -1)

        # -----------------------------
        # Save using matplotlib
        # -----------------------------
        img_rgb = cv2.cvtColor(img_vis, cv2.COLOR_BGR2RGB)

        fig = plt.figure(figsize=(10, 6))
        plt.imshow(img_rgb)
        plt.title(name)
        plt.axis("off")

        safe_name = os.path.basename(name)
        save_path = os.path.join(out_dir, safe_name)

        plt.savefig(save_path, dpi=200, bbox_inches="tight")
        plt.close(fig)

        print(f"[OK] Saved {save_path}")

    conn.close()
    

def visualize_matches(image_dir, db_path, out_dir="debug/matches", max_pairs=10, max_matches=100):

    """
    Visualize verified feature matches stored in COLMAP's two_view_geometries.

    Parameters
    ----------
    image_dir : str
        Directory containing the images.
    db_path : str
        Path to COLMAP database.db.
    out_dir : str
        Output directory.
    max_pairs : int
        Number of image pairs to visualize.
    max_matches : int
        Maximum matches drawn per image pair.
    """

    os.makedirs(out_dir, exist_ok=True)

    conn = sqlite3.connect(db_path)
    cur = conn.cursor()

    # -----------------------------
    # Load images and keypoints
    # -----------------------------
    images = load_images(cur)          # [(image_id, name), ...]
    kpt_dict = load_keypoints(cur)     # {image_id : Nx6 array}

    image_name_dict = {
        image_id: name
        for image_id, name in images
    }

    # -----------------------------
    # Load verified matches
    # -----------------------------
    pairs = load_matches(cur)

    # -----------------------------
    # Draw best pairs
    # -----------------------------
    for image_id1, image_id2, matches in pairs[:max_pairs]:

        name1 = image_name_dict[image_id1]
        name2 = image_name_dict[image_id2]

        img1 = cv2.imread(os.path.join(image_dir, name1))
        img2 = cv2.imread(os.path.join(image_dir, name2))

        if img1 is None or img2 is None:
            continue

        kp1 = kpt_dict[image_id1]
        kp2 = kpt_dict[image_id2]

        # Create side-by-side canvas
        h = max(img1.shape[0], img2.shape[0])
        w = img1.shape[1] + img2.shape[1]

        canvas = np.zeros((h, w, 3), dtype=np.uint8)

        canvas[:img1.shape[0], :img1.shape[1]] = img1
        canvas[:img2.shape[0], img1.shape[1]:] = img2

        offset = img1.shape[1]

        # Draw matches
        for idx1, idx2 in matches[:max_matches]:

            x1, y1 = kp1[idx1, :2].astype(int)
            x2, y2 = kp2[idx2, :2].astype(int)

            color = (0, 255, 0)

            cv2.circle(canvas, (x1, y1), 3, color, -1)
            cv2.circle(canvas, (x2 + offset, y2), 3, color, -1)

            cv2.line(
                canvas,
                (x1, y1),
                (x2 + offset, y2),
                color,
                1,
            )

        # Save
        canvas_rgb = cv2.cvtColor(canvas, cv2.COLOR_BGR2RGB)

        fig = plt.figure(figsize=(14, 7))
        plt.imshow(canvas_rgb)
        plt.axis("off")
        plt.title(
            f"{os.path.basename(name1)}  <->  {os.path.basename(name2)}"
        )

        save_name = (
            f"{os.path.splitext(os.path.basename(name1))[0]}"
            f"__"
            f"{os.path.splitext(os.path.basename(name2))[0]}.png"
        )

        plt.savefig(
            os.path.join(out_dir, save_name),
            dpi=200,
            bbox_inches="tight",
        )
        plt.close(fig)

        print(
            f"[OK] Saved {save_name} "
            f"({min(max_matches, len(matches))}/{len(matches)} matches)"
        )

    conn.close()



def main():
    path = "debug"

    if os.path.exists(path):
        shutil.rmtree(path)

    # os.makedirs(path, exist_ok=True)

    # visualize_keypoints_on_images(
    #     image_dir="dataset\All_faces_sculpted_derivatives\90_1920x1080_relief_heightmap_1_all_cone.obj\images",
    #     db_path="dataset\All_faces_sculpted_derivatives\90_1920x1080_relief_heightmap_1_all_cone.obj\colmap\database.db",
    #     out_dir="dataset\All_faces_sculpted_derivatives\90_1920x1080_relief_heightmap_1_all_cone.obj\debug\keypoints",
    # )
    visualize_matches(
        image_dir="G:\elefth\coral\gopro_underwater\images",
        db_path="G:\elefth\coral\gopro_underwater\database.db",
        out_dir="G:\elefth\coral\gopro_underwater\matches",
        max_pairs=10, max_matches=50)


if __name__ == "__main__":
    main()
    
        

    
    
            
        
    
