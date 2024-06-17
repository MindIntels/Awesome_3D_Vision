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
