%the purpose of this script is to perform gaussian expanssion
%   created 10/12/16

I = imread('compressedI8.jpg');
figure(1), imshow(I)
I = double(I);
Ie = expandImage(I);
figure(2), imshow(mat2gray(Ie))