%color detection program
I=imread('rgbtest.jpg');
figure(1)
imshow(I)
I2=colorfilt(I,0,0,255,30);
figure(2)
imshow(I2)
hold on
point=findcenter(I2);

plot(round(point(2)),round(point(1)),'*b')

