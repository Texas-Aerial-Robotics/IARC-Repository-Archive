I = zeros(51,51);
[row, col] = size(I);
for ii=1:row
   for i=1:col
      I(ii,i) = rand*255;
       
   end
end
figure(1); imshow(mat2gray(I));
imwrite(mat2gray(I),'I1.jpg')
IMove = I(25:50,25:50);

figure(2); imshow(mat2gray(IMove));

I2 = I;
I2(26:51,26:51) = IMove;

figure(3); imshow(mat2gray(I2))
imwrite(mat2gray(I2),'I2.jpg')
