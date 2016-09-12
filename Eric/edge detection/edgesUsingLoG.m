%The purpose of this script is to demonstrate edge detection using LoG
%Last modified by Eric Johnson on 8/20/2016
clc; clear all
close all
tic
I = rgb2gray(imread('roomba.jpg'));
figure(1), imshow(I)
info = imfinfo('roomba.jpg')
[height, width, z] = size(I);
I = I(:,:,1);

dimension = 7;
sigma = 1;

[guassMask] = createGuassMask(dimension, sigma)

I = conv2(I, guassMask, 'same');

LoG = createLoG(dimension, sigma)
I = conv2(I, LoG, 'same');
figure(2) , imshow(mat2gray(I))

[height, width] = size(I);
edges = ones(height, width);
for row=1:height
   for col=1:width
      if I(row, col) < -18
          edges(row, col) = 0;
      end 
   end
end
figure(3), imshow(edges)
toc


