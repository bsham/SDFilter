%
clc;
clear all;

addpath 'algorithms'
addpath 'graphAnalysisToolbox-1.0'

%% Img name
data = ['books';'devil';'shark'];
only_name = cellstr(data);

%%parameters
nei= 0;                % 0: 4-neighbor 1: 8-neighbor
lambda = 10;           % smoothness parameter
mu = 500;              % bw for static guidance
nu = 200;              % bw for dynamic guidance
step=20;
issparse = true;

folder_name = './results/depthSR/';
if ~exist(folder_name, 'dir')
    mkdir(folder_name);
end

for p=1:length(only_name)
    St = sprintf('img: %s',only_name{p});
    disp(St);
    
    img_name = ['./imgs/depthSR/' only_name{p} '.bmp'];
    dep_name = ['./imgs/depthSR/' only_name{p} '_depth.bmp'];
    dep = im2double(imread(dep_name));
    img = im2double(imread(img_name));
    [m, n] = size(img);
    
    %% u^0=const
    disp('u^0 = costant');
    result_name = [folder_name only_name{p} '_sd-filtering.png'];
    u0=ones(m,n);
    upsampling_result = sdfilter(img,u0,dep,nei,lambda,mu,nu,step,issparse);
    imwrite(upsampling_result, result_name,'png');
    
    %% irregular interpolation
    result_name = [folder_name only_name{p} '_interpolated.png'];
    [i,j] = find(dep); 
    indexes = sub2ind(size(dep),i,j); 
    interpolator = scatteredInterpolant(i,j,double(dep(indexes)), 'natural'); 
    [Y,X] = meshgrid( 1:size(dep,2),1:size(dep,1)); 
    upsampling_result = interpolator(X,Y); 
    imwrite(upsampling_result, result_name,'png');
end


