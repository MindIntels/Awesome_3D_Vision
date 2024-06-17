# Fine-tune on an inpainted single image for 150 iterations.
python gaussian_splatting/train.py -s ./data/spin_7/ -m output/spin_7_unmasked -u img070.png -n data/spin_7/SD_outputs/img070.png --load_iteration 30001 --iteration 150
