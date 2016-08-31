%image reading test
tic
rGB=imread('FiftyGray.jpg');
g=rgb2gray(rGB);
imshow(g)

I=Gauss_special(g,7,1.6,sqrt(2));
figure(2)
imshow(I)
I2=Gauss_special(g,7,1.6,2);
figure(3)
imshow(I2)

I3=I-I2;
I3=mat2gray(I3);
figure(4)
imshow(I3)
toc