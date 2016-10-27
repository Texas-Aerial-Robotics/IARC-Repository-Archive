I = rgb2gray(imread('lowcontrast.jpg'));
figure(1), imshow(I)
I = double(I);
Icontrast = adjustContrast(I);
figure(2), imshow(mat2gray(I))
