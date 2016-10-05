%the purpose of the user defined function is to perform convolution
%   MEETING 1: 9/14/2016
function [Ifiltered] = convolution1(I, mask)
%take size of image matrix
[rowI, colI] =size(I);

[dx, dy] = size(mask);

rx = (dx-1)/2;
ry = (dy-1)/2;

%define the size of output matrix
Ifiltered = zeros(rowI, colI);

%iterates rows
for row=ry+1:rowI-(ry+1)
    %iterates columns 
    for col=(rx+1):colI-(rx+1)
        %fill sub matrix 
        mSub = I(row-ry:row+ry,col-rx:col+rx);
        %apply average mask
        mSub = mSub.*mask;
        %assign value to output matrix
        Ifiltered(row,col) = sum(sum(mSub));
    end
end

