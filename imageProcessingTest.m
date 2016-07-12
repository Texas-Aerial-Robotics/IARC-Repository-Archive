%the purpose of this script is to test differnt image processing functions
%   for later application in lucas kanade optical flow method 
%   last modified by Eric Johnson on 6/7/16 
clc; clear all
close all


gRGB = imread('test.jpg');
g = rgb2gray(gRGB);
subplot(1,4,1) , imshow(g)
info = imfinfo('test.jpg')
% adds noise 
for p=1:250
   for q=1:374
     g(q,p) = g(q,p) + 10*randn(1);  
   end
end
subplot(1,4,2), imshow(g)


%smoothing using average filter 

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
subplot(1,4,3), imshow(mat2gray(gFiltered))


g1 = [1, 4,  7,  4,  1];
g2 = [4, 16, 26, 16, 4];
g3 = [7, 26, 41, 26, 7];
g4 = [4, 16, 26, 16, 4];
g5 = [1, 4,  7,  4,  1];
guassMask = [g1; g2; g3; g4; g5];
guassMask = (1/273)*guassMask;
for p=3:541
    for q=3:528
        mSub = zeros(5);
        for x=-2:2
            for y=-2:2
                mSub(y+3,x+3) = double(g(q+y,p+x));
            end
        end
        mSub = mSub*guassMask;
        %sum mSub
        sum=0;
        for x=1:5
           for y=1:5
               sum= sum + mSub(y,x);
           end
        end
        gFilteredG(q,p) = sum;
        
    end
end
subplot(1,4,4), imshow(mat2gray(gFilteredG))




