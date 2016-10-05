%the 
clc; clear all
close all
I = rgb2gray(imread('BMWi8.jpg'));
figure(1), imshow(I)
size(I)
I = double(I);
tic
for k=1:3
Ic = compressImage(I);
I = Ic;
figure(k+1), imshow(mat2gray(Ic))
end
toc
size(Ic)