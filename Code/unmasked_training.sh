cd Code
# raw training
python gaussian_splatting/train.py -s ./data/ro_006/ -m output/ro_006_unmasked -u nothing --mask_training
# rendering
python gaussian_splatting/render.py -s ./data/ro_006 -m ./output/ro_006_unmasked -u nothing