%The purpose of this script is to show an example of applying a guassian
%   filter
%   created 11/21/16
clc; clear all 
close all 
%inport image 
Image=rgb2gray(imread('BMWi8.jpg'));
figure(1), imshow(Image)

%change image to a matrix type
Matrix=double(Image);

%generate guassian mask
dimension = 25;
guassMask = createGuassian(dimension);

%apply mask to the image 
I = convolution1(Matrix, guassMask);

%change matrix back to image type and display 
Image2=mat2gray(I);
figure(2), imshow(Image2)
