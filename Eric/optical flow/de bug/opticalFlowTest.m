%purpose of this script is to test optical flow
clc; clear all; close all;
v1 = VideoReader('videoTest.mp4')
video = read(v1, [50,51]);
im1 = rgb2gray(video(:,:,:,1));
im2 = rgb2gray(video(:,:,:,2));
for k =1:2
    im1 = double(im1);
    im1 = compressImage(im1);
    im2 = double(im2);
    im2 = compressImage(im2);
end
% im1 = imread('I1.jpg');
% im2 = imread('I2.jpg');

figure(1); imshow(mat2gray(im1))
figure(2); imshow(mat2gray(im2))
tic
[u, v] = lucasKanade(im1, im2);
toc
uimage=mat2gray(u);
vimage=mat2gray(v);

figure(3); imshow(uimage)
figure(4); imshow(vimage)

