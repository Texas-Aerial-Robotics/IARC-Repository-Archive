clc; clear all
close all
warning('off', 'Images:initSize:adjustingMag');
%load image
I =rgb2gray(imread('roomba.jpg'));
figure(1), imshow(I)
I = double(I);

%define guassian mask 
dimension =5;
guassMask = createGuassian(dimension);

%perform smoothing with guassian mask
[Ifiltered] = convolution1(I, guassMask);
figure(2), imshow(mat2gray(Ifiltered))

%define image derivative masks 
dx = [1, 0, -1; 1,0,-1;1,0,-1];
dx = dx/3;
dy = [1,1,1;0,0,0;-1,-1,-1];
dy = dy/3;

%apply derivative masks to image 
[Dx] = convolution1(Ifiltered, dx);
[Dy] = convolution1(Ifiltered, dy);

%take a magnitude of derivative 
mag = sqrt(Dx.^2 + Dy.^2);

[height, width] = size(I);
%make new matrix for edges image 
edges = ones(height, width);
%define edge threshold 
threshold = 100;
%apply threshold to every indice 
for col=1:height
   for row=1:width
       if mag(col,row) > threshold
           edges(col, row) = 0;
       end
   end
end

figure(3), imshow(im2uint8(edges))



