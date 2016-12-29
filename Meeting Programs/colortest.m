clc; clear all; close all
I= imread('offCenter.jpg');
figure(1)
imshow(I)

I2=colordetect(I,22,86,16,15);
figure(2)
imshow(I2)
[x,y]=centerfinder(I2);
p = [x,y];
z = 1;
[height, width] = size(I);
[pMeters] = findXYDistance(height, width, z, p);
hold on
plot(y,x,'b*')
figure(3)
axis([-1,1,-1,1])
hold on
plot(0,0, 'y*')
hold on
plot(pMeters(1), pMeters(2), 'b*');
