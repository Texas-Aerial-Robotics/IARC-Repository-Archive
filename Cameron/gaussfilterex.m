%Gaussian Filter Example
Image=rgb2gray(imread('roomba.jpg'));
figure(1)
imshow(Image)
Matrix=double(Image);
dimension=7;
gaussMask = gaussfunction(dimension);
I=convolution1(Matrix, gaussMask);
Image2=mat2gray(filtered);
figure(2)
imshow(Image2)