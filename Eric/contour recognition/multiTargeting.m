clc; clear all
close all
IOG = imread('multiTargets.jpg');
figure(1), imshow(IOG)
I = rgb2gray(IOG);
I = double(I);
tic
I = detectEdges(I);


[cFill] = findContours(I);
[height, width, numContours] = size(cFill);
p = zeros(1,2);
for k=1:numContours
    [p(k,:)]=findcenter(cFill(:,:,k));
end
toc
figure(2), imshow(IOG)
hold on
for k=1:numContours
    plot(round(p(k,2)),round(p(k,1)),'*b')
end

