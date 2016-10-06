I = rgb2gray(imread('BMWi8.jpg'));
figure(1), imshow(I)
I = double(I);
for k=1:3
    Icom = compressImage(I);
    figure(k+1), imshow(mat2gray(Icom))
    I = Icom;
end

