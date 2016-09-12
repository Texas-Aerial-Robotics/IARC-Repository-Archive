%the purpose of this script is to write a sample program to demonstrate my
%   knowledge of guassian expansion pyramids
%   last modified 7/19/2016 by Eric Johnson 

clc; clear all 
close all

I = imread('compressedI8.jpg');
[height,width,z1] = size(I);
figure(1), imshow(I)
info = imfinfo('compressedI8.jpg')

%generate 1d horizontal guassian mask
dimension = 5;
sigma = 1;
[GuassMask1D] = create1DGuassMask(dimension, sigma);
GuassMask1D = GuassMask1D*.4;

for e=1:3
    [height,width,z1] = size(I);
    IExpand = zeros(height, width*2);
    for y=1:height
        ii=1;
        for x=1:width-3
            ii = ii+1;
            mSub = zeros(1,3);
            for i=1:3
                mSub(i) = I(y,x+i);
            end
            IExpand(y,ii) = GuassMask1D(2)*(mSub(1)+mSub(2));
            if x ~=width-3
                ii = ii+1;
                IExpand(y,ii) = GuassMask1D(1)*mSub(1)+ GuassMask1D(3)*mSub(2) + GuassMask1D(1)*mSub(3);
            end
            
        end
    end
    
    IExpand2 = zeros(height*2, width*2);
    for x=1:width*2
        ii=1;
        for y=1:height-3
            ii = ii+1;
            mSub = zeros(1,3);
            for i=1:3
                mSub(i) = IExpand(y+i,x);
            end
            IExpand2(ii,x) = GuassMask1D(2)*(mSub(1)+mSub(2));
            if y ~=height-3
                ii = ii+1;
                IExpand2(ii,x) = GuassMask1D(1)*mSub(1)+ GuassMask1D(3)*mSub(2) + GuassMask1D(1)*mSub(3);
            end
            
        end
    end
    figure(e+1), imshow(mat2gray(IExpand2))
    I = IExpand2; 
end