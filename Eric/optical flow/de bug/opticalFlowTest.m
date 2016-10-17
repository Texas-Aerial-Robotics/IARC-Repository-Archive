%purpose of this script is to test optical flow
clc; clear all; close all;
v1 = VideoReader('videoTest.mp4')
video = read(v1, [50,51]);
im1 = rgb2gray(video(:,:,:,1));
im2 = rgb2gray(video(:,:,:,2));
im1 = double(im1);
im2 = double(im2);
[fx, fy, ft] = ComputeDerivatives(im1, im2);

u = zeros(size(im1));
v = zeros(size(im2));

[height, width] = size(im1);
for i=2:height-1
   for j=2:width-1
      %fill least square matrix A
      curFx = fx(i-1:i+1, j-1:j+1);
      curFy = fy(i-1:i+1, j-1:j+1);
      curFt = ft(i-1:i+1, j-1:j+1);
      
      
      curFx = curFx';
      curFy = curFy';
      curFt = curFt';


      curFx = curFx(:);
      curFy = curFy(:);
      curFt = -curFt(:);
      
      A = [curFx,curFy];
      
      U = pinv(A'*A)*A'*curFt;
      
      u(i,j)=U(1);
      v(i,j)=U(2);
      
   end
end

u(isnan(u))=0;
v(isnan(v))=0;


for k =1:2
    im1 = double(im1);
    im1 = compressImage(im1);
    im2 = double(im2);
    im2 = compressImage(im2);
end
% im1 = imread('I1.jpg  weqrfdxgcccccccccc cxzv rd
% im2 = imread('I2.jpg');

figure(1); imshow(mat2gray(im1))
figure(2); imshow(mat2gray(im2))
tic
%[u, v] = lucasKanade(im1, im2);
toc
uimage=mat2gray(u);
vimage=mat2gray(v);

figure(3); imshow(uimage)
figure(4); imshow(vimage)
figure(5)
quiver(u, v)

