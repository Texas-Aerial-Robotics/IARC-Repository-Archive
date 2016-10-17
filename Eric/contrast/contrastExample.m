%the purpose of this script is to be an example of how to adjust the
%   contrast of an image
clc; clear all
close all
I = rgb2gray(imread('lowcontrast.jpg'));
figure(1), imshow(I)
I =double(I);
tic
Icontrast = adjustContrast(I);
toc
figure(2), imshow(mat2gray(I))
