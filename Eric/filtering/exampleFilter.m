

I = rgb2gray(imread('roomba.jpg'));
I = double(I);
figure(1), imshow(mat2gray(I))
[Ifiltered] = convolution1(I);

figure(2), imshow(mat2gray(Ifiltered)) 
