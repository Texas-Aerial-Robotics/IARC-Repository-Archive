%color detection program
clc; clear all; close all
I=imread('offCenter.jpg');
figure(1)
imshow(I)
I2=colorfilt(I,22,86,16,30);
figure(2)
imshow(I2)
hold on
point=findcenter(I2);

plot(round(point(2)),round(point(1)),'*b')
[height, width] = size(I);
z = 1; %in meters 
[pMeters] = findXYDistance(height, width, z, point);
figure(3)
axis([-1, 1, -1, 1]);
hold on
plot(0,0, 'y*')
hold on
plot(pMeters(1), pMeters(2), '*b')


