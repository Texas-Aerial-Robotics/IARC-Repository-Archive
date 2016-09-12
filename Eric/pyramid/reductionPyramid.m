%the purpose of this script is to write a sample program to demonstrate my
%   knowledge of guassian reduction pyramids
%   last modified 7/19/2016 by Eric Johnson 

clc; clear all 
close all

I = rgb2gray(imread('BMWi8.jpg'));
[height,width,z1] = size(I);
figure(1), imshow(I)
info = imfinfo('BMWi8.jpg')

%generate 1d horizontal guassian mask
dimension = 5;
sigma = 1;
[GuassMask1D] = create1DGuassMask(dimension, sigma);
GuassMask1D = GuassMask1D*.4;

for r=1:3
    [height,width] = size(I);
    %apply guassian horizontally
    %
    if mod(width,2) == 1
       width = width -1; 
    end
    IReduced = zeros(height,width/2);
    %incriments from 1 to the height of the image
    %   for loop move the cell beig manipulated down 1
    for y=1:height
        ii = 0;
        %incriment cell -->
        for x=1:2:width-5
            ii = ii+1;
            mSub = zeros(1,5);
            %fill mSub
            for i=1:5
                mSub(i) = I(y,x-1+i);
            end
            mSub;
            %apply guassian mask to mSub
            mSub = mSub.*GuassMask1D;
            intensity = sum(mSub);
            IReduced(y,ii+1) = intensity;
        end
    end
    
    if mod(height,2) == 1
        height =height - 1;
    end
    IReduced2 = zeros(height/2,width/2);
    %apply guassian vertically
    for x=2:width/2
        ii=0;
        for y=1:2:height-5
            ii = ii+1;
            mSub = zeros(5,1);
            %fill mSub
            for i=1:5
                mSub(i) = IReduced(y-1+i,x);
            end
            mSub;
            %apply guassian mask to mSub
            mSub = mSub.*GuassMask1D';
            intensity = sum(mSub);
            IReduced2(ii+1,x) = intensity;
        end
        
    end
    figure(r+1), imshow(mat2gray(IReduced2))
    I = IReduced2; 
end
%imwrite(mat2gray(I),'compressedI8.jpg');
