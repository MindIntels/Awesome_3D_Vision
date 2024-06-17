# Awesome_3D_Vision

<div align='center'>
  <img src=https://cdn.rawgit.com/sindresorhus/awesome/d7305f38d29fed78fa85652e3a63e154dd8e8829/media/badge.svg >
  <img src=https://img.shields.io/github/downloads/MindIntels/Awesome_3D_Vision/total?color=ccf&label=downloads&logo=github&logoColor=lightgrey >
  <img src=https://img.shields.io/github/forks/MindIntels/Awesome_3D_Vision.svg?style=social >
  <img src=https://img.shields.io/github/stars/MindIntels/Awesome_3D_Vision.svg?style=social >
  <img src=https://img.shields.io/github/watchers/MindIntels/Awesome_3D_Vision.svg?style=social >
  <img src=https://img.shields.io/badge/Release-v0.1-brightgreen.svg >
 </div>   

## 📒Motivation
- Tracking the cutting-edge 3D Reconstruction and Generation technology, including 3D Gaussian Splatting, SLAM, Neural Radiance Fields.
- Analyzing the State-of-the-art papers from top conferences, including but not limited to SIGGRAPH, CVPR, ICCV, ECCV, ICLR, ICML and NIPS.
- Replicating classical paper results with SOTA performance.
- Integrating the state-of-the-art algorithms and deploy it directly on the edge devices. 

## 📙TODO
- [2024.6.17]🔥 Based on [Infusion](https://github.com/ali-vilab/Infusion), fix a bug of it, supplement the code and open majority of source codes. 
- Integrating [SAGA](https://github.com/Jumpat/SegAnyGAussians), [LangSplat](https://github.com/minghanqin/LangSplat) into our system, for 3D semantic segmentation / open-vocabulary segmentation tasks.
- Integrating [LGM](https://github.com/3DTopia/LGM), [LucidDreamer](https://github.com/EnVision-Research/LucidDreamer?tab=readme-ov-file) into our system, for 3D object generation task.


## Survey and Papers 
- 🔥 [A Survey on 3D Gaussian Splatting](https://arxiv.org/abs/2401.03890) ⭐️⭐️⭐
- 🔥[**DreamGaussian: Generative Gaussian Splatting for Efficient 3D Content Creation**](https://arxiv.org/abs/2309.16653)⭐️⭐️


## Experiments Visualization

Based on [Infusion](https://github.com/ali-vilab/Infusion), 3D inpainting task is supported in our system.
Original scene:
<div align=center>
<img src="https://github.com/MindIntels/Awesome_3D_Vision/assets/59688873/10ecab55-cd1e-410f-a4cc-57c1d624f2a1" width="60%">
</div>

After removing target object:
<div align=center>
<img src="https://github.com/MindIntels/Awesome_3D_Vision/assets/59688873/36655771-df17-4147-97e5-d5d5cc882ae7" width="60%">
</div>

Initial scene by lifting points to fill unmasked region:
<div align=center>
<img src="https://github.com/MindIntels/Awesome_3D_Vision/assets/59688873/fb946134-ba2a-40e8-b32c-61d85f537582" width="60%">
</div>

Finetuned scene:
<div align=center>
<img src="https://github.com/MindIntels/Awesome_3D_Vision/assets/59688873/b84bb42f-82d1-46e3-8c8b-fa2a90bf1cfd" width="60%">
</div>



## Deploying Tutorial

[3D inpainting](https://github.com/MindIntels/Awesome_3D_Vision/tree/main/Tutorial)

