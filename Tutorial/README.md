# Deploying Tutorial

## 1 Environment Setting

```python
# 1. create conda env
conda create -n awesome_3d python=3.9
# 2. install pytorch and corresponding packages
conda install pytorch==2.0.1 torchvision==0.15.2 torchaudio==2.0.2 pytorch-cuda=11.8 -c pytorch -c nvidia
# 3. install cudatoolkit-dev to ensure nvcc
conda install -c conda-forge cudatoolkit-dev
# 4. install other packages
pip install -r requirements.txt

# 5. install submodules
pip install Code/gaussian_splatting/submodules/simple-knn/
pip install Code/gaussian_splatting/submodules/diff-gaussian-rasterization-confidence/
```

## 2 Raw training
Use off-the-shelf 3DGS to train and render a raw model.
```python
cd Code
# raw training
python gaussian_splatting/train.py -s ./data/ro_006/ -m output/ro_006 -u nothing
# rendering
python gaussian_splatting/render.py -s ./data/ro_006 -m ./output/ro_006 -u nothing
```
<div align=center>
<img src="https://github.com/MindIntels/Awesome_3D_Vision/assets/59688873/10ecab55-cd1e-410f-a4cc-57c1d624f2a1" width="60%">
</div>


Only training the unmasked regions of input images.
```python
cd Code
# raw training
python gaussian_splatting/train.py -s ./data/ro_006/ -m output/ro_006_unmasked -u nothing --mask_training
# rendering
python gaussian_splatting/render.py -s ./data/ro_006 -m ./output/ro_006_unmasked -u nothing
```
<div align=center>
<img src="https://github.com/MindIntels/Awesome_3D_Vision/assets/59688873/36655771-df17-4147-97e5-d5d5cc882ae7" width="60%">
</div>


## 3 Use pretrained depth inpainting model to fill masked region
### 3.1 Download pretrained depth inpainting model
Please download the Infusion checkpoint and put it in the 'checkpoints' folder: [huggingface](https://huggingface.co/Johanan0528/Infusion/tree/main)

### 3.2 Depth inpainting and lifting points to 3D space
Choose a reference view to do depth inpainting, for lifting points to 3D space.
You can easily run `bash depth_inpainting.sh`.
```cmd
cd Infusion/depth_inpainting/run
dataname="$1"
picname="$2"

input_rgb_path="../../../data/${dataname}/SD_outputs/$picname.png"
input_mask_path="../../../data/${dataname}/mask2d/$picname.png"
input_depth_path="../../../output/${dataname}_unmasked/train/ours_30000/depth/$picname.npy"
c2w="../../../output/${dataname}_unmasked/train/ours_30000/c2w/$picname.npy"
intri="../../../output/${dataname}_unmasked/train/ours_30000/intri/$picname.npy"
model_path="/media/SSD/peng/Infusion/checkpoints"
output_dir="../../../output/${dataname}_unmasked"

python run_inference_inpainting.py \
            --input_rgb_path $input_rgb_path \
            --input_mask $input_mask_path \
            --input_depth_path $input_depth_path \
            --model_path $model_path \
            --output_dir $output_dir \
            --denoise_steps 20 \
            --intri $intri \
            --c2w $c2w \
            --use_mask\
```

### 3.3 Compose unmasked scene and initial masked scene
You can easily run `bash compose.sh`.
```cmd
dataname="$1"

origin_ply="output/$dataname/point_cloud/iteration_30000/point_cloud.ply"
supp_ply="output/$dataname/img070_mask.ply"
save_ply="output/$dataname/point_cloud/iteration_30001/point_cloud.ply"
# Combine inpainted gaussians and incomplete gaussians.
python Infusion/compose.py --original_ply $origin_ply  --supp_ply $supp_ply --save_ply $save_ply --nb_points 100 --threshold 1.0
```
Then you can render the complete initial scene.
```cmd
python gaussian_splatting/render.py -s ./data/spin_7 -m ./output/spin_7_unmasked -u nothing
```
<div align=center>
<img src="https://github.com/MindIntels/Awesome_3D_Vision/assets/59688873/fb946134-ba2a-40e8-b32c-61d85f537582" width="60%">
</div>


### 3.4 Finetune the masked region
You can use the reference view to finetune masked region.
```cmd
python gaussian_splatting/train.py -s ./data/spin_7/ -m output/spin_7_unmasked -u img070.png -n data/spin_7/SD_outputs/img070.png --load_iteration 30001 --iteration 150
```
Then you can render the final scene.
```cmd
python gaussian_splatting/render.py -s ./data/spin_7 -m ./output/spin_7_unmasked -u nothing --iteration 150
```
<div align=center>
<img src="https://github.com/MindIntels/Awesome_3D_Vision/assets/59688873/b84bb42f-82d1-46e3-8c8b-fa2a90bf1cfd" width="60%">
</div>

