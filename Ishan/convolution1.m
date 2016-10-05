%the purpose of the user defined function is to perform convolution
%   MEETING 1: 9/14/2016
function [Ifiltered] = convolution1(I, mask)
%take size of image matrix
[rowI, colI] = size(I);

[dx, dy] = size(mask);

r = (dx-1)/2;

%define the size of output matrix
Ifiltered = zeros(rowI, colI);

%iterates rows
for row=r+1:rowI-(r+1)
    %iterates columns 
    for col=(r+1):colI-(r+1)
        %fill sub matrix 
        mSub = I(row-r:row+r,col-r:col+r);
        %apply average mask
        mSub = mSub.*mask;
        %assign value to output matrix
        Ifiltered(row,col) = sum(sum(mSub));
    end
end

