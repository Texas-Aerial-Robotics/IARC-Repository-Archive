%the purpose of this program is show how to apply a filter to an image
%   MEETING 1: 9/14/2015

% import image, rgb2gray() converts to gray image
I = rgb2gray(imread('roomba.jpg'));
%convert image matrix to a matrix type
I = double(I);
%create a window and show raw image 
figure(1), imshow(mat2gray(I))
%call user defined function
[Ifiltered] = convolution1(I);
%display filtered image 
figure(2), imshow(mat2gray(Ifiltered)) 
