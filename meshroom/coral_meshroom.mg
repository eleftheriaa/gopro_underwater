{
    "header": {
        "releaseVersion": "2025.1.0",
        "fileVersion": "2.0",
        "nodesVersions": {
            "CameraInit": "12.0",
            "ConvertSfMFormat": "2.0",
            "DepthMap": "5.0",
            "DepthMapFilter": "4.0",
            "FeatureExtraction": "1.3",
            "FeatureMatching": "2.0",
            "ImageDetectionPrompt": "0.1",
            "ImageMatching": "2.0",
            "ImageSegmentationBox": "0.2",
            "MeshFiltering": "3.0",
            "Meshing": "7.0",
            "PrepareDenseScene": "3.1",
            "StructureFromMotion": "3.3",
            "Texturing": "6.0"
        }
    },
    "graph": {
        "CameraInit_1": {
            "nodeType": "CameraInit",
            "position": [
                0,
                0
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 193,
                "split": 1
            },
            "uid": "7fde186ffa0858e7c58cf74dfdd6f5edf92e0997",
            "internalFolder": "{cache}/{nodeType}/{uid}",
            "inputs": {
                "viewpoints": [
                    {
                        "viewId": 31799080,
                        "poseId": 31799080,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_105.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 58542236,
                        "poseId": 58542236,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_106.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 69473389,
                        "poseId": 69473389,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_103.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 75986915,
                        "poseId": 75986915,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_107.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 79429944,
                        "poseId": 79429944,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_104.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 84910478,
                        "poseId": 84910478,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_043.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 91719701,
                        "poseId": 91719701,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_046.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 99981909,
                        "poseId": 99981909,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_042.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 108695285,
                        "poseId": 108695285,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_159.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 112213397,
                        "poseId": 112213397,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_156.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 113159252,
                        "poseId": 113159252,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_044.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 113520390,
                        "poseId": 113520390,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_157.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 115188841,
                        "poseId": 115188841,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_045.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 129661892,
                        "poseId": 129661892,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_182.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 135163328,
                        "poseId": 135163328,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_056.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 147884119,
                        "poseId": 147884119,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_054.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 149309530,
                        "poseId": 149309530,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_055.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 162263682,
                        "poseId": 162263682,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_168.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 174695825,
                        "poseId": 174695825,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_052.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 197050569,
                        "poseId": 197050569,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_053.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 202912793,
                        "poseId": 202912793,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_183.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 249734521,
                        "poseId": 249734521,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_164.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 250405466,
                        "poseId": 250405466,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_165.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 255274325,
                        "poseId": 255274325,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_166.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 255909673,
                        "poseId": 255909673,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_041.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 257595983,
                        "poseId": 257595983,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_040.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 259296756,
                        "poseId": 259296756,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_184.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 262054235,
                        "poseId": 262054235,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_167.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 264547829,
                        "poseId": 264547829,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_181.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 278142503,
                        "poseId": 278142503,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_128.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 292340376,
                        "poseId": 292340376,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_158.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 299237397,
                        "poseId": 299237397,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_125.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 301963300,
                        "poseId": 301963300,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_126.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 346307605,
                        "poseId": 346307605,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_137.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 379069509,
                        "poseId": 379069509,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_127.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 380324436,
                        "poseId": 380324436,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_050.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 382558613,
                        "poseId": 382558613,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_051.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 405830792,
                        "poseId": 405830792,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_003.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 407108955,
                        "poseId": 407108955,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_002.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 417476724,
                        "poseId": 417476724,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_001.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 447938039,
                        "poseId": 447938039,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_129.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 449918387,
                        "poseId": 449918387,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_140.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 451734381,
                        "poseId": 451734381,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_141.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 461555437,
                        "poseId": 461555437,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_193.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 498162303,
                        "poseId": 498162303,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_017.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 498711476,
                        "poseId": 498711476,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_016.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 501549759,
                        "poseId": 501549759,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_014.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 503084751,
                        "poseId": 503084751,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_015.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 508034771,
                        "poseId": 508034771,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_018.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 527234006,
                        "poseId": 527234006,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_118.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 533390384,
                        "poseId": 533390384,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_116.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 543797427,
                        "poseId": 543797427,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_110.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 545593640,
                        "poseId": 545593640,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_119.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 551972813,
                        "poseId": 551972813,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_117.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 564046424,
                        "poseId": 564046424,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_111.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 564608775,
                        "poseId": 564608775,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_133.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 568461154,
                        "poseId": 568461154,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_131.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 569678625,
                        "poseId": 569678625,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_130.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 570324249,
                        "poseId": 570324249,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_132.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 573160987,
                        "poseId": 573160987,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_071.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 573886486,
                        "poseId": 573886486,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_108.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 575819910,
                        "poseId": 575819910,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_070.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 577371697,
                        "poseId": 577371697,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_109.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 581910875,
                        "poseId": 581910875,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_068.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 584247862,
                        "poseId": 584247862,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_069.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 631892121,
                        "poseId": 631892121,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_150.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 642778116,
                        "poseId": 642778116,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_169.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 672784652,
                        "poseId": 672784652,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_134.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 675573004,
                        "poseId": 675573004,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_136.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 678557741,
                        "poseId": 678557741,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_135.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 688872970,
                        "poseId": 688872970,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_098.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 705445683,
                        "poseId": 705445683,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_019.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 750473551,
                        "poseId": 750473551,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_096.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 750535729,
                        "poseId": 750535729,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_097.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 771579893,
                        "poseId": 771579893,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_067.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 796821258,
                        "poseId": 796821258,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_095.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 807081707,
                        "poseId": 807081707,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_177.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 823225342,
                        "poseId": 823225342,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_179.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 824512161,
                        "poseId": 824512161,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_124.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 826385832,
                        "poseId": 826385832,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_121.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 828828596,
                        "poseId": 828828596,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_123.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 830241365,
                        "poseId": 830241365,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_122.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 848227652,
                        "poseId": 848227652,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_027.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 848769016,
                        "poseId": 848769016,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_025.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 849273125,
                        "poseId": 849273125,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_024.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 851858990,
                        "poseId": 851858990,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_026.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 855078249,
                        "poseId": 855078249,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_178.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 862862629,
                        "poseId": 862862629,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_023.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 865922627,
                        "poseId": 865922627,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_143.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 868685496,
                        "poseId": 868685496,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_142.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 895818670,
                        "poseId": 895818670,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_060.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 917336396,
                        "poseId": 917336396,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_120.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 994363608,
                        "poseId": 994363608,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_080.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1057971654,
                        "poseId": 1057971654,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_061.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1074383276,
                        "poseId": 1074383276,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_059.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1085316770,
                        "poseId": 1085316770,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_152.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1086678468,
                        "poseId": 1086678468,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_155.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1087001368,
                        "poseId": 1087001368,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_058.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1089058538,
                        "poseId": 1089058538,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_154.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1099484460,
                        "poseId": 1099484460,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_057.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1100790871,
                        "poseId": 1100790871,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_153.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1135526549,
                        "poseId": 1135526549,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_180.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1148549207,
                        "poseId": 1148549207,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_077.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1148986273,
                        "poseId": 1148986273,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_076.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1152084831,
                        "poseId": 1152084831,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_079.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1155517662,
                        "poseId": 1155517662,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_078.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1163402404,
                        "poseId": 1163402404,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_029.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1164705667,
                        "poseId": 1164705667,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_028.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1177740430,
                        "poseId": 1177740430,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_185.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1183267425,
                        "poseId": 1183267425,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_188.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1188295516,
                        "poseId": 1188295516,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_189.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1205881322,
                        "poseId": 1205881322,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_187.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1206333972,
                        "poseId": 1206333972,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_186.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1277522290,
                        "poseId": 1277522290,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_145.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1278308623,
                        "poseId": 1278308623,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_144.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1282519338,
                        "poseId": 1282519338,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_146.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1314278995,
                        "poseId": 1314278995,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_151.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1346620531,
                        "poseId": 1346620531,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_022.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1362530405,
                        "poseId": 1362530405,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_062.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1366040200,
                        "poseId": 1366040200,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_063.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1403440076,
                        "poseId": 1403440076,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_020.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1408440747,
                        "poseId": 1408440747,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_021.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1419745293,
                        "poseId": 1419745293,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_089.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1447332668,
                        "poseId": 1447332668,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_087.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1463815681,
                        "poseId": 1463815681,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_033.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1468744525,
                        "poseId": 1468744525,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_066.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1473142461,
                        "poseId": 1473142461,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_064.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1476086578,
                        "poseId": 1476086578,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_065.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1510532399,
                        "poseId": 1510532399,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_010.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1512865512,
                        "poseId": 1512865512,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_011.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1520072172,
                        "poseId": 1520072172,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_013.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1525025679,
                        "poseId": 1525025679,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_012.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1525505392,
                        "poseId": 1525505392,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_099.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1527774156,
                        "poseId": 1527774156,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_031.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1530322805,
                        "poseId": 1530322805,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_030.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1539669080,
                        "poseId": 1539669080,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_009.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1556702544,
                        "poseId": 1556702544,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_008.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1581864891,
                        "poseId": 1581864891,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_072.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1582843560,
                        "poseId": 1582843560,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_073.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1588341784,
                        "poseId": 1588341784,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_075.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1589772893,
                        "poseId": 1589772893,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_074.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1590789115,
                        "poseId": 1590789115,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_086.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1611538861,
                        "poseId": 1611538861,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_092.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1612365732,
                        "poseId": 1612365732,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_093.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1612553436,
                        "poseId": 1612553436,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_034.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1617451177,
                        "poseId": 1617451177,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_091.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1617462165,
                        "poseId": 1617462165,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_035.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1621181720,
                        "poseId": 1621181720,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_036.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1622686942,
                        "poseId": 1622686942,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_094.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1624083788,
                        "poseId": 1624083788,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_090.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1649169344,
                        "poseId": 1649169344,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_163.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1651020559,
                        "poseId": 1651020559,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_162.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1654961374,
                        "poseId": 1654961374,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_004.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1666201367,
                        "poseId": 1666201367,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_005.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1668240074,
                        "poseId": 1668240074,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_006.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1668790408,
                        "poseId": 1668790408,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_007.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1685086176,
                        "poseId": 1685086176,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_174.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1687078964,
                        "poseId": 1687078964,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_032.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1691502848,
                        "poseId": 1691502848,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_037.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1700402994,
                        "poseId": 1700402994,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_049.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1708195907,
                        "poseId": 1708195907,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_047.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1710749843,
                        "poseId": 1710749843,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_048.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1750823104,
                        "poseId": 1750823104,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_038.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1766596883,
                        "poseId": 1766596883,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_139.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1772230421,
                        "poseId": 1772230421,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_138.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1773491504,
                        "poseId": 1773491504,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_088.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1774175608,
                        "poseId": 1774175608,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_039.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1802322557,
                        "poseId": 1802322557,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_170.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1803769230,
                        "poseId": 1803769230,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_171.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1805455852,
                        "poseId": 1805455852,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_172.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1837423464,
                        "poseId": 1837423464,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_160.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1843512587,
                        "poseId": 1843512587,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_161.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1851016557,
                        "poseId": 1851016557,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_112.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1854599067,
                        "poseId": 1854599067,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_113.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1865373585,
                        "poseId": 1865373585,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_191.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1876682993,
                        "poseId": 1876682993,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_190.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1877868373,
                        "poseId": 1877868373,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_192.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1897540974,
                        "poseId": 1897540974,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_147.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1904499424,
                        "poseId": 1904499424,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_148.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1906405165,
                        "poseId": 1906405165,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_149.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1964362754,
                        "poseId": 1964362754,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_114.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1969546606,
                        "poseId": 1969546606,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_081.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1973442036,
                        "poseId": 1973442036,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_082.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1974046319,
                        "poseId": 1974046319,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_083.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1979083695,
                        "poseId": 1979083695,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_115.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 2034486475,
                        "poseId": 2034486475,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_101.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 2036854282,
                        "poseId": 2036854282,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_100.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 2041384921,
                        "poseId": 2041384921,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_102.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 2052653941,
                        "poseId": 2052653941,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_176.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 2053268992,
                        "poseId": 2053268992,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_175.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 2057960665,
                        "poseId": 2057960665,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_085.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 2058052261,
                        "poseId": 2058052261,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_084.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 2076057084,
                        "poseId": 2076057084,
                        "path": "G:/elefth/coral/gopro_underwater/images/frame_173.png",
                        "intrinsicId": 1624079270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    }
                ],
                "intrinsics": [
                    {
                        "intrinsicId": 1624079270,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.45584412271571,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "scaleLocked": false,
                        "offsetLocked": false,
                        "distortionLocked": false,
                        "type": "pinhole",
                        "distortionType": "radialk3",
                        "width": 3840,
                        "height": 2160,
                        "sensorWidth": 36.0,
                        "sensorHeight": 20.25,
                        "serialNumber": "G:/elefth/coral/gopro_underwater/images",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    }
                ],
                "sensorDatabase": "${ALICEVISION_SENSOR_DB}",
                "lensCorrectionProfileInfo": "${ALICEVISION_LENS_PROFILE_INFO}",
                "lensCorrectionProfileSearchIgnoreCameraModel": true,
                "defaultFieldOfView": 45.0,
                "groupCameraFallback": "folder",
                "rawColorInterpretation": "LibRawWhiteBalancing",
                "colorProfileDatabase": "${ALICEVISION_COLOR_PROFILE_DB}",
                "errorOnMissingColorProfile": true,
                "viewIdMethod": "metadata",
                "viewIdRegex": ".*?(\\d+)",
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{nodeCacheFolder}/cameraInit.sfm"
            }
        },
        "ConvertSfMFormat_1": {
            "nodeType": "ConvertSfMFormat",
            "position": [
                1000,
                160
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 193,
                "split": 1
            },
            "uid": "f9ebcdba8228d6fdc4666bac4679a547265aee11",
            "internalFolder": "{cache}/{nodeType}/{uid}",
            "inputs": {
                "input": "{StructureFromMotion_1.output}",
                "fileExt": "ply",
                "describerTypes": [
                    "dspsift"
                ],
                "imageWhiteList": [],
                "views": true,
                "intrinsics": true,
                "extrinsics": true,
                "structure": true,
                "observations": true,
                "surveys": true,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{nodeCacheFolder}/sfm.{fileExtValue}"
            }
        },
        "DepthMapFilter_1": {
            "nodeType": "DepthMapFilter",
            "position": [
                1400,
                0
            ],
            "parallelization": {
                "blockSize": 24,
                "size": 193,
                "split": 9
            },
            "uid": "2cdb331a8f729bb33294d1d69932e99977c0a62c",
            "internalFolder": "{cache}/{nodeType}/{uid}",
            "inputs": {
                "input": "{DepthMap_1.input}",
                "depthMapsFolder": "{DepthMap_1.output}",
                "minViewAngle": 2.0,
                "maxViewAngle": 70.0,
                "nNearestCams": 10,
                "minNumOfConsistentCams": 3,
                "minNumOfConsistentCamsWithLowSimilarity": 4,
                "pixToleranceFactor": 2.0,
                "pixSizeBall": 0,
                "pixSizeBallWithLowSimilarity": 0,
                "computeNormalMaps": false,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{nodeCacheFolder}",
                "depth": "{nodeCacheFolder}/<VIEW_ID>_depthMap.exr",
                "sim": "{nodeCacheFolder}/<VIEW_ID>_simMap.exr",
                "normal": "{nodeCacheFolder}/<VIEW_ID>_normalMap.exr"
            }
        },
        "DepthMap_1": {
            "nodeType": "DepthMap",
            "position": [
                1200,
                0
            ],
            "parallelization": {
                "blockSize": 12,
                "size": 193,
                "split": 17
            },
            "uid": "cd081387aa5eb303f0d61c9aa047da60fc288116",
            "internalFolder": "{cache}/{nodeType}/{uid}",
            "inputs": {
                "input": "{PrepareDenseScene_1.input}",
                "imagesFolder": "{PrepareDenseScene_1.output}",
                "downscale": 2,
                "minViewAngle": 2.0,
                "maxViewAngle": 70.0,
                "tiling": {
                    "tileBufferWidth": 1024,
                    "tileBufferHeight": 1024,
                    "tilePadding": 64,
                    "autoAdjustSmallImage": true
                },
                "chooseTCamsPerTile": true,
                "maxTCams": 10,
                "sgm": {
                    "sgmScale": 2,
                    "sgmStepXY": 2,
                    "sgmStepZ": -1,
                    "sgmMaxTCamsPerTile": 4,
                    "sgmWSH": 4,
                    "sgmUseSfmSeeds": true,
                    "sgmSeedsRangeInflate": 0.2,
                    "sgmDepthThicknessInflate": 0.0,
                    "sgmMaxSimilarity": 1.0,
                    "sgmGammaC": 5.5,
                    "sgmGammaP": 8.0,
                    "sgmP1": 10.0,
                    "sgmP2Weighting": 100.0,
                    "sgmMaxDepths": 1500,
                    "sgmFilteringAxes": "YX",
                    "sgmDepthListPerTile": true,
                    "sgmUseConsistentScale": false
                },
                "refine": {
                    "refineEnabled": true,
                    "refineScale": 1,
                    "refineStepXY": 1,
                    "refineMaxTCamsPerTile": 4,
                    "refineSubsampling": 10,
                    "refineHalfNbDepths": 15,
                    "refineWSH": 3,
                    "refineSigma": 15.0,
                    "refineGammaC": 15.5,
                    "refineGammaP": 8.0,
                    "refineInterpolateMiddleDepth": false,
                    "refineUseConsistentScale": false
                },
                "colorOptimization": {
                    "colorOptimizationEnabled": true,
                    "colorOptimizationNbIterations": 100
                },
                "customPatchPattern": {
                    "sgmUseCustomPatchPattern": false,
                    "refineUseCustomPatchPattern": false,
                    "customPatchPatternSubparts": [],
                    "customPatchPatternGroupSubpartsPerLevel": false
                },
                "intermediateResults": {
                    "exportIntermediateDepthSimMaps": false,
                    "exportIntermediateNormalMaps": false,
                    "exportIntermediateVolumes": false,
                    "exportIntermediateCrossVolumes": false,
                    "exportIntermediateTopographicCutVolumes": false,
                    "exportIntermediateVolume9pCsv": false,
                    "exportTilePattern": false
                },
                "nbGPUs": 0,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{nodeCacheFolder}",
                "depth": "{nodeCacheFolder}/<VIEW_ID>_depthMap.exr",
                "sim": "{nodeCacheFolder}/<VIEW_ID>_simMap.exr",
                "tilePattern": "{nodeCacheFolder}/<VIEW_ID>_tilePattern.obj",
                "depthSgm": "{nodeCacheFolder}/<VIEW_ID>_depthMap_sgm.exr",
                "depthSgmUpscaled": "{nodeCacheFolder}/<VIEW_ID>_depthMap_sgmUpscaled.exr",
                "depthRefined": "{nodeCacheFolder}/<VIEW_ID>_depthMap_refinedFused.exr"
            }
        },
        "FeatureExtraction_1": {
            "nodeType": "FeatureExtraction",
            "position": [
                200,
                0
            ],
            "parallelization": {
                "blockSize": 40,
                "size": 193,
                "split": 5
            },
            "uid": "a2e2d3eb0f42ae4949f5059519c5f540f11ee198",
            "internalFolder": "{cache}/{nodeType}/{uid}",
            "inputs": {
                "input": "{CameraInit_1.output}",
                "masksFolder": "",
                "maskExtension": "png",
                "maskInvert": false,
                "describerTypes": [
                    "dspsift"
                ],
                "describerPreset": "normal",
                "maxNbFeatures": 0,
                "describerQuality": "normal",
                "contrastFiltering": "GridSort",
                "relativePeakThreshold": 0.01,
                "gridFiltering": true,
                "workingColorSpace": "sRGB",
                "forceCpuExtraction": true,
                "maxThreads": 0,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{nodeCacheFolder}"
            }
        },
        "FeatureMatching_1": {
            "nodeType": "FeatureMatching",
            "position": [
                600,
                0
            ],
            "parallelization": {
                "blockSize": 20,
                "size": 193,
                "split": 10
            },
            "uid": "6820d7c5a710d5de2d581494996ceb103823e497",
            "internalFolder": "{cache}/{nodeType}/{uid}",
            "inputs": {
                "input": "{ImageMatching_1.input}",
                "featuresFolders": "{ImageMatching_1.featuresFolders}",
                "imagePairsList": "{ImageMatching_1.output}",
                "describerTypes": "{FeatureExtraction_1.describerTypes}",
                "photometricMatchingMethod": "ANN_L2",
                "geometricEstimator": "acransac",
                "geometricFilterType": "fundamental_matrix",
                "distanceRatio": 0.8,
                "maxIteration": 50000,
                "geometricError": 0.0,
                "knownPosesGeometricErrorMax": 5.0,
                "minRequired2DMotion": -1.0,
                "maxMatches": 0,
                "savePutativeMatches": false,
                "crossMatching": false,
                "guidedMatching": false,
                "matchFromKnownCameraPoses": false,
                "exportDebugFiles": false,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{nodeCacheFolder}"
            }
        },
        "ImageDetectionPrompt_1": {
            "nodeType": "ImageDetectionPrompt",
            "position": [
                200,
                160
            ],
            "parallelization": {
                "blockSize": 50,
                "size": 193,
                "split": 4
            },
            "uid": "e7eb0f48f5a19ed3f7d340ce4bc43e6cd693933e",
            "internalFolder": "{cache}/{nodeType}/{uid}",
            "inputs": {
                "input": "{CameraInit_1.output}",
                "recognitionModelPath": "${RDS_RECOGNITION_MODEL_PATH}",
                "detectionModelPath": "${RDS_DETECTION_MODEL_PATH}",
                "detectionConfigPath": "${RDS_DETECTION_CONFIG_PATH}",
                "prompt": "main",
                "synonyms": "",
                "forceDetection": true,
                "thresholdDetection": 0.2,
                "bboxMargin": 0,
                "useGpu": true,
                "outputBboxImage": false,
                "keepFilename": false,
                "extension": "jpg",
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": "#575963"
            },
            "outputs": {
                "output": "{nodeCacheFolder}",
                "bboxes": "{nodeCacheFolder}/<VIEW_ID>.jpg"
            }
        },
        "ImageMatching_1": {
            "nodeType": "ImageMatching",
            "position": [
                400,
                0
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 193,
                "split": 1
            },
            "uid": "bbedcc1fcd2eeb9640111efc28efbd2f98fb41c4",
            "internalFolder": "{cache}/{nodeType}/{uid}",
            "inputs": {
                "input": "{FeatureExtraction_1.input}",
                "featuresFolders": [
                    "{FeatureExtraction_1.output}"
                ],
                "method": "SequentialAndVocabularyTree",
                "tree": "${ALICEVISION_VOCTREE}",
                "weights": "",
                "minNbImages": 200,
                "maxDescriptors": 500,
                "nbMatches": 40,
                "nbNeighbors": 5,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{nodeCacheFolder}/imageMatches.txt"
            }
        },
        "ImageSegmentationBox_1": {
            "nodeType": "ImageSegmentationBox",
            "position": [
                400,
                160
            ],
            "parallelization": {
                "blockSize": 50,
                "size": 193,
                "split": 4
            },
            "uid": "dfe5bcb5840314ec9744e421564b6224bd73eba2",
            "internalFolder": "{cache}/{nodeType}/{uid}",
            "inputs": {
                "input": "{ImageDetectionPrompt_1.input}",
                "bboxFolder": "{ImageDetectionPrompt_1.output}",
                "nukeTracker": "",
                "segmentationModelPath": "${RDS_SEGMENTATION_MODEL_PATH}",
                "maskInvert": false,
                "useGpu": true,
                "keepFilename": true,
                "extension": "png",
                "outputBboxImage": false,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": "#575963"
            },
            "outputs": {
                "output": "{nodeCacheFolder}",
                "masks": "{nodeCacheFolder}/<FILESTEM>.png",
                "bboxes": "{nodeCacheFolder}/bboxes_<FILESTEM>.jpg"
            }
        },
        "MeshFiltering_1": {
            "nodeType": "MeshFiltering",
            "position": [
                1800,
                0
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 1,
                "split": 1
            },
            "uid": "801c3a5a88f498a7e097259e7c662e40488edc72",
            "internalFolder": "{cache}/{nodeType}/{uid}",
            "inputs": {
                "inputMesh": "{Meshing_1.outputMesh}",
                "outputMeshFileType": "obj",
                "keepLargestMeshOnly": false,
                "smoothingSubset": "all",
                "smoothingBoundariesNeighbours": 0,
                "smoothingIterations": 5,
                "smoothingLambda": 1.0,
                "filteringSubset": "all",
                "filteringIterations": 1,
                "filterLargeTrianglesFactor": 60.0,
                "filterTrianglesRatio": 0.0,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "outputMesh": "{nodeCacheFolder}/mesh.{outputMeshFileTypeValue}"
            }
        },
        "Meshing_1": {
            "nodeType": "Meshing",
            "position": [
                1600,
                0
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 1,
                "split": 1
            },
            "uid": "f576a1f075a3f4d5406c8e252629deb5886fe4cc",
            "internalFolder": "{cache}/{nodeType}/{uid}",
            "inputs": {
                "input": "{DepthMapFilter_1.input}",
                "depthMapsFolder": "{DepthMapFilter_1.output}",
                "outputMeshFileType": "obj",
                "useBoundingBox": false,
                "boundingBox": {
                    "bboxTranslation": {
                        "x": 0.0,
                        "y": 0.0,
                        "z": 0.0
                    },
                    "bboxRotation": {
                        "x": 0.0,
                        "y": 0.0,
                        "z": 0.0
                    },
                    "bboxScale": {
                        "x": 1.0,
                        "y": 1.0,
                        "z": 1.0
                    }
                },
                "estimateSpaceFromSfM": true,
                "estimateSpaceMinObservations": 3,
                "estimateSpaceMinObservationAngle": 10.0,
                "maxInputPoints": 50000000,
                "maxPoints": 5000000,
                "maxPointsPerVoxel": 1000000,
                "minStep": 2,
                "partitioning": "singleBlock",
                "repartition": "multiResolution",
                "angleFactor": 15.0,
                "simFactor": 15.0,
                "minVis": 2,
                "pixSizeMarginInitCoef": 2.0,
                "pixSizeMarginFinalCoef": 4.0,
                "voteMarginFactor": 4.0,
                "contributeMarginFactor": 2.0,
                "simGaussianSizeInit": 10.0,
                "simGaussianSize": 10.0,
                "minAngleThreshold": 1.0,
                "refineFuse": true,
                "helperPointsGridSize": 10,
                "densify": false,
                "densifyNbFront": 1,
                "densifyNbBack": 1,
                "densifyScale": 20.0,
                "nPixelSizeBehind": 4.0,
                "fullWeight": 1.0,
                "voteFilteringForWeaklySupportedSurfaces": true,
                "addLandmarksToTheDensePointCloud": false,
                "invertTetrahedronBasedOnNeighborsNbIterations": 10,
                "minSolidAngleRatio": 0.2,
                "nbSolidAngleFilteringIterations": 2,
                "colorizeOutput": false,
                "addMaskHelperPoints": false,
                "maskHelperPointsWeight": 1.0,
                "maskBorderSize": 4,
                "maxNbConnectedHelperPoints": 50,
                "saveRawDensePointCloud": false,
                "exportDebugTetrahedralization": false,
                "seed": 0,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "outputMesh": "{nodeCacheFolder}/mesh.{outputMeshFileTypeValue}",
                "output": "{nodeCacheFolder}/densePointCloud.abc"
            }
        },
        "PrepareDenseScene_1": {
            "nodeType": "PrepareDenseScene",
            "position": [
                1000,
                0
            ],
            "parallelization": {
                "blockSize": 40,
                "size": 193,
                "split": 5
            },
            "uid": "8cbf0fa69cfafcce1d05235e871dcc27bfbb54f8",
            "internalFolder": "{cache}/{nodeType}/{uid}",
            "inputs": {
                "input": "{StructureFromMotion_1.output}",
                "imagesFolders": [],
                "masksFolders": [
                    "{ImageSegmentationBox_1.output}"
                ],
                "maskExtension": "png",
                "outputFileType": "exr",
                "saveMetadata": true,
                "saveMatricesTxtFiles": false,
                "evCorrection": false,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{nodeCacheFolder}",
                "undistorted": "{nodeCacheFolder}/<VIEW_ID>.{outputFileTypeValue}"
            }
        },
        "PrepareDenseScene_2": {
            "nodeType": "PrepareDenseScene",
            "position": [
                1000,
                320
            ],
            "parallelization": {
                "blockSize": 40,
                "size": 193,
                "split": 5
            },
            "uid": "5955f0e98ca8baa73da420f8dea78982ac4da716",
            "internalFolder": "{cache}/{nodeType}/{uid}",
            "inputs": {
                "input": "{StructureFromMotion_1.output}",
                "imagesFolders": [],
                "masksFolders": [
                    "{ImageSegmentationBox_1.output}"
                ],
                "maskExtension": "png",
                "outputFileType": "png",
                "saveMetadata": true,
                "saveMatricesTxtFiles": false,
                "evCorrection": false,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{nodeCacheFolder}",
                "undistorted": "{nodeCacheFolder}/<VIEW_ID>.{outputFileTypeValue}"
            }
        },
        "StructureFromMotion_1": {
            "nodeType": "StructureFromMotion",
            "position": [
                800,
                0
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 193,
                "split": 1
            },
            "uid": "1c572710aadbe44aaa674e378434bb1584a39eed",
            "internalFolder": "{cache}/{nodeType}/{uid}",
            "inputs": {
                "input": "{FeatureMatching_1.input}",
                "featuresFolders": "{FeatureMatching_1.featuresFolders}",
                "matchesFolders": [
                    "{FeatureMatching_1.output}"
                ],
                "describerTypes": "{FeatureMatching_1.describerTypes}",
                "localizerEstimator": "acransac",
                "observationConstraint": "Scale",
                "localizerEstimatorMaxIterations": 50000,
                "localizerEstimatorError": 0.0,
                "lockScenePreviouslyReconstructed": false,
                "useLocalBA": true,
                "localBAGraphDistance": 1,
                "nbFirstUnstableCameras": 30,
                "maxImagesPerGroup": 30,
                "bundleAdjustmentMaxOutliers": 50,
                "maxNumberOfMatches": 0,
                "minNumberOfMatches": 0,
                "minInputTrackLength": 2,
                "minNumberOfObservationsForTriangulation": 2,
                "minAngleForTriangulation": 3.0,
                "minAngleForLandmark": 2.0,
                "maxReprojectionError": 4.0,
                "minAngleInitialPair": 5.0,
                "maxAngleInitialPair": 40.0,
                "useOnlyMatchesFromInputFolder": false,
                "useRigConstraint": true,
                "rigMinNbCamerasForCalibration": 20,
                "lockAllIntrinsics": false,
                "minNbCamerasToRefinePrincipalPoint": 3,
                "filterTrackForks": false,
                "computeStructureColor": true,
                "useAutoTransform": true,
                "initialPairA": "",
                "initialPairB": "",
                "interFileExtension": ".abc",
                "logIntermediateSteps": false,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{nodeCacheFolder}/sfm.abc",
                "outputViewsAndPoses": "{nodeCacheFolder}/cameras.sfm",
                "extraInfoFolder": "{nodeCacheFolder}"
            }
        },
        "Texturing_1": {
            "nodeType": "Texturing",
            "position": [
                2000,
                0
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 1,
                "split": 1
            },
            "uid": "a4a7c263d85d75bb9d97a2915dc39198845b8081",
            "internalFolder": "{cache}/{nodeType}/{uid}",
            "inputs": {
                "input": "{Meshing_1.output}",
                "imagesFolder": "{DepthMap_1.imagesFolder}",
                "normalsFolder": "",
                "inputMesh": "{MeshFiltering_1.outputMesh}",
                "inputRefMesh": "",
                "textureSide": 8192,
                "downscale": 2,
                "outputMeshFileType": "obj",
                "colorMapping": {
                    "enable": true,
                    "colorMappingFileType": "exr"
                },
                "bumpMapping": {
                    "enable": true,
                    "bumpType": "Normal",
                    "normalFileType": "exr",
                    "heightFileType": "exr"
                },
                "displacementMapping": {
                    "enable": true,
                    "displacementMappingFileType": "exr"
                },
                "unwrapMethod": "Basic",
                "useUDIM": true,
                "fillHoles": false,
                "padding": 5,
                "multiBandDownscale": 4,
                "multiBandNbContrib": {
                    "high": 1,
                    "midHigh": 5,
                    "midLow": 10,
                    "low": 0
                },
                "useScore": true,
                "bestScoreThreshold": 0.1,
                "angleHardThreshold": 90.0,
                "workingColorSpace": "sRGB",
                "outputColorSpace": "AUTO",
                "correctEV": true,
                "forceVisibleByAllVertices": false,
                "flipNormals": false,
                "visibilityRemappingMethod": "PullPush",
                "subdivisionTargetRatio": 0.8,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{nodeCacheFolder}",
                "outputMesh": "{nodeCacheFolder}/texturedMesh.{outputMeshFileTypeValue}",
                "outputMaterial": "{nodeCacheFolder}/texturedMesh.mtl",
                "outputTextures": "{nodeCacheFolder}/texture_*.exr"
            }
        }
    }
}