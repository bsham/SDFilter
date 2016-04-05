Matlab demo code for joint static and dynamic guidance filter (SDFilter) v1.1 (2015-05-22)

Contributed by Bumsub Ham (bumsub.ham@inria.fr)

Usage: 
Run "runSDF_scale_space.m” in MATLAB for scale-space filtering
Run "runSDF_depthsr.m” in MATLAB for depth super-resolution
(Note that the bandwidth parameters, ‘\mu’ and ‘\nu’, and the regularization parameter, ‘\lambda’, are set to different values due to the normalization.)

Notes:
* Texture removal can be done by substituting the static guidance image ’g’ in "runSDF_scale_space.m” with the Gaussian filtered version of the input image ‘f’.
* The code is provided for academic use only. Use of the code in any commercial or industrial related activities is prohibited. 
* If you use our code, please cite the paper. 

@InProceedings{ham2015,
author = {Bumsub Ham and Minsu Cho and Jean Ponce},
title = {Robust Image Filtering using Joint Static and Dynamic Guidance},
booktitle = {Proceedings of the IEEE Conference on Computer Vision and Pattern Recognition (CVPR), IEEE},
year = {2015}
}

* This code uses some graph functions in the Graph Analysis Toolbox (http://eslab.bu.edu/software/graphanalysis/).
* We use the Graz data set for depth super-resolution. Please cite the paper shown below, if you use this dataset.

@inproceedings{ferstl2013b, 
author = {David Ferstl and Christian Reinbacher and Rene Ranftl and Matthias Ruether and Horst Bischof}, 
title = {Image Guided Depth Upsampling using Anisotropic Total Generalized Variation}, 
booktitle = {Proceedings International Conference on Computer Vision (ICCV), IEEE},
year = {2013}
} 

If you have any questions, please contact: Bumsub Ham (bumsub.ham@inria.fr).