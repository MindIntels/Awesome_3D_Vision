cd Code
# raw training
python gaussian_splatting/train.py -s ./data/ro_006/ -m output/ro_006 -u nothing
# rendering
python gaussian_splatting/render.py -s ./data/ro_006 -m ./output/ro_006 -u nothing