dataname="$1"

origin_ply="output/$dataname/point_cloud/iteration_30000/point_cloud.ply"
supp_ply="output/$dataname/img070_mask.ply"
save_ply="output/$dataname/point_cloud/iteration_30001/point_cloud.ply"
# Combine inpainted gaussians and incomplete gaussians.
python Infusion/compose.py --original_ply $origin_ply  --supp_ply $supp_ply --save_ply $save_ply --nb_points 100 --threshold 1.0