%purpose of this script is to test optical flow
clc; clear all; close all;
im1 = imread('I1.jpg');
im2 = imread('I2.jpg');

figure(1); imshow(mat2gray(im1))
figure(2); imshow(mat2gray(im2))
tic
[u, v] = lucasKanade(im1, im2);
toc
uimage=mat2gray(u);
vimage=mat2gray(v);

figure(3); imshow(uimage)
figure(4); imshow(vimage)

