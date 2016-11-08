I= imread('cRR.jpg');
figure(1)
imshow(I)

I2=colordetect(I,22,86,16,15);
figure(2)
imshow(I2)
[x,y]=centerfinder(I2);
hold on
plot(x,y,'b*')