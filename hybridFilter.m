%Gabriela Pedreros - gp21j 
%Computer Vision - hw 1 - part c: hybrid images

% Read in the first image in the pair as im1 and the second as im2
im1 = imread("woman_happy.png");
im2 = imread("woman_neutral.png");

% Resize both images to the same square size (e.g. 512x512)
im1Resize = imresize(im1, [512 512]);
im2Resize = imresize(im2, [512 512]);

% convert them to grayscale.
im1Gray = rgb2gray(im1Resize);
im2Gray = rgb2gray(im2Resize);

%gaussian filter in matlab notes from lecture
hsize = 100; %filter size
sigma = 12; %standard deviation, blur for happy face?
%create gaussian filter
h = fspecial('gaussian', hsize, sigma); 
im1_blur = imfilter(im1Gray, h);
im2_blur = imfilter(im2Gray, h);

%image details
im2_detail = im2Gray - im2_blur;
%im2_detail = im2_detail + 1;
im2_detail = im2_detail * .1;

%hybrid = im1_blur + im2_detail;
hybrid = 0.7 * im1_blur + 1.3 * im2_detail; 
% adjusting weights to balance the contribution

imshow(hybrid);
title('Hybrid: Happy and Neutral Woman')
imwrite(hybrid, 'hybrid.png')
