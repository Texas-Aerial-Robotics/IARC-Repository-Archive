%the purpose of this script is to test differnt image processing functions
%   for later application in lucas kanade optical flow method 
%   last modified by Eric Johnson on 6/7/16 
clc; clear all
close all


gRGB = imread('FiftyGray.jpg');
g = rgb2gray(gRGB)
subplot(1,3,1) , imshow(g)
info = imfinfo('FiftyGray.jpg')
% adds noise 
for p=1:250
   for q=1:374
     g(q,p) = g(q,p) + 10*randn(1);  
   end
end
subplot(1,3,2), imshow(g)


%smoothing using average filter 
f = ones(3);
subM = zeros(3);
for p=3:248
    for q=3:372
        sum = 0;
        for x=-2:2
            for y=-2:2
                sum=double(g(q+y,p+x))+sum;
            end
        end
        gFiltered(q,p) = round((1/25)*sum);
    end
end
subplot(1,3,3), imshow(mat2gray(gFiltered))