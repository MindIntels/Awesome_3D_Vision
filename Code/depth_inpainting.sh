# Assume that the selected single image is named "DSC07956.JPG".
cd Infusion/depth_inpainting/run
# dataname = 'ro_006'
# picname = '005'
dataname="$1"
picname="$2"

#
input_rgb_path="../../../data/${dataname}/SD_outputs/$picname.png"
input_mask_path="../../../data/${dataname}/mask2d/$picname.png"
input_depth_path="../../../output/${dataname}_unmasked/train/ours_30000/depth/$picname.npy"
c2w="../../../output/${dataname}_unmasked/train/ours_30000/c2w/$picname.npy"
intri="../../../output/${dataname}_unmasked/train/ours_30000/intri/$picname.npy"
# model_path="/media/SSD/peng/Infusion/checkpoints"
model_path="######"  ### your checkpoints dir
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
            # --blend  # Whether to use 'Blended Diffusion (https://arxiv.org/abs/2111.14818)' during inference. 