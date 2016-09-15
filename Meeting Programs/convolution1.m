%the purpose of the user defined function is to perform convolution
%   MEETING 1: 9/14/2016
function [Ifiltered] = convolution1(I)
%take size of image matrix
[rowI, colI] =size(I);

%define average mask
mask = [1, 1, 1; 1,1,1;1,1,1];
mask = mask/9;

%define the size of output matrix
Ifiltered = zeros(rowI, colI);

%iterates rows
for row=2:rowI-1
    %iterates columns 
    for col=2:colI-1
        %fill sub matrix 
        mSub = I(row-1:row+1,col-1:col+1);
        %apply average mask
        mSub = mSub.*mask;
        %assign value to output matrix
        Ifiltered(row,col) = sum(sum(mSub));
    end
end

