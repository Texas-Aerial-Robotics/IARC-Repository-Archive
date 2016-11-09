clc; clear all
close all
IOG = imread('test2.jpg');
figure(1), imshow(IOG)
[height, width, d] = size(IOG);
I = double(IOG);
tic
cal = imread('calibration.jpg');
r = 88 %sum(sum(cal(:,:,1)))/(height*width);
g = 125 %sum(sum(cal(:,:,2)))/(height*width);
b = 73 %sum(sum(cal(:,:,3)))/(height*width);
[I]=colorfilt(I,r,g,b,40);
I = imfill(I, 'holes');
I = bwmorph(I, 'erode');
I = bwmorph(I, 'dilate',8);
I = bwmorph(I, 'erode');
I = bwmorph(I, 'dilate',8);
I = bwmorph(I, 'erode');
I = bwmorph(I, 'dilate',8);
I = bwmorph(I, 'erode');
I = bwmorph(I, 'dilate',8);
I = bwmorph(I, 'erode');
I = bwmorph(I, 'dilate',8);
I = bwmorph(I, 'erode');
figure(2), imshow(I)
I = 255*I;
I = detectEdges(I);


[cFill] = findContours(I);
[height, width, numContours] = size(cFill);
p = zeros(1,2);
for k=1:numContours
    [p(k,:)]=findcenter(cFill(:,:,k));
end
z=1; %height in meters. intput from Stereo camera
[height, width,d] = size(I);
[pMeters] = findXYDistance(height, width, z, p)



toc
figure(3), imshow(IOG)
hold on
plot(round(height/2), round(width/2), 'y*')
for k=1:numContours
    plot(round(p(k,2)),round(p(k,1)),'*b')
end
figure(4)
title('targets')
axis([-.57,.57,-.57,.57]);
hold on
plot(0,0, 'y*')
hold on
plot(pMeters(:,1), pMeters(:,2), 'r*')
