%gauss filter example
Image=rgb2gray(imread('BMWi8.jpg'));
figure(1)
imshow(Image)
Matrix=double(Image);

dimension = 25;
guassMask = createGuassian(dimension);

I = convolution1(Matrix, guassMask);
Image2=mat2gray(I);
figure(2)
imshow(Image2)