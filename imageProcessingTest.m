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
     g(q,p) = g(q,p) + 20*randn(1);  
   end
end
subplot(1,3,2), imshow(g)


%smoothing using average filter 
f = ones(3);
subM = zeros(3);
for p=2:249
    for q=2:373
        sum = 0;
        for x=-1:1
            for y=-1:1
                sum=g(q+y,p+x);
            end
        end
        gFiltered(q,p) = (1/9)*sum;
    end
end
subplot(1,3,3), imshow(gFiltered)