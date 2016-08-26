%the purpose of this user defined function is to reduce an image to 1/4
%it's original size
%last modified by Eric Johnson on 8/22/2016
function [IR] = reduceImage(I)
%generate 1d horizontal guassian mask
dimension = 5;
sigma = 1;
[GuassMask1D] = create1DGuassMask(dimension, sigma);
GuassMask1D = GuassMask1D*.4;

[height,width,z] = size(I);
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
                mSub(i) = I(y,x-1+i,1);
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
IR = IReduced2;

