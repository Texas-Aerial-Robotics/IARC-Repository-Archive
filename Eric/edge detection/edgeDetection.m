%the purpose of this script is to detect edges in images 
%   last modified 6/7/16
clc; clear all 
close all

I = rgb2gray(imread('roomba.jpg'));
figure(1), imshow(I)
info = imfinfo('roomba.jpg')
I = double(I);


dimension=3;
sigma=2;
guassMask = createGuassMask(dimension, sigma);

[Ifiltered] = convolution(guassMask, I);
figure(2), imshow(mat2gray(Ifiltered))

DMaskx = [1,0,-1;1,0,-1;1,0,-1];
DMasky = [1,1,1;0,0,0;-1,-1,-1];
DMaskx = DMaskx/3;
DMasky = DMasky/3;
[m,n] = size(Ifiltered);
dx = convolution(DMaskx, I);
dy = convolution(DMasky, I);

DMag = sqrt((dx.^2) + (dy.^2));
threshold = 30;

edges = ones(m,n);
for p=1:n
   for q=1:m
      if DMag(q,p) > threshold
          edges(q,p) = 0;
      end
   end
end
figure(3), imshow(im2uint8(edges))





