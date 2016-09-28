%the purpose of this script is to demonstrate basic image filtering 
%   last modified 9/12/2016
clc; clear all
close all

I = rgb2gray(imread('roomba.jpg'));
[height,width,z1] = size(I);
info = imfinfo('roomba.jpg')
figure(1), imshow(I)
I = double(I);

dimension = 5;
sigma = (dimension-1)/3;
[guassMask] = createGuassMask(dimension, sigma);

tic 
Icon = convolution(guassMask, I);
toc
figure(2), imshow(mat2gray(Icon))

IDis = zeros(748,1500,2);


IDis(:,:,1) = I(1:height/2,1:width);
IDis(:,:,2) = I((height/2)+1:height,1:width);
tic
parfor k=1:2
    I1Con(:,:,k) = convolution(guassMask, IDis(:,:,k));
end
toc
IF = [I1Con(:,:,1); I1Con(:,:,2)];


figure(3), imshow(mat2gray(IF))

