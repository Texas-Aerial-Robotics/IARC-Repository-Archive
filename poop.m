clc;
close all;
I = rgb2gray(imread('FiftyGray.jpg'));
[height,width,z1] = size(I)
figure(1), imshow(I)
info = imfinfo('FiftyGray.jpg')
[Ifiltered ] = guassFilter(I);
figure(2), imshow(mat2gray(Ifiltered))