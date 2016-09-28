%the purpose of the user defined function is to perform convolution
%   MEETING 1: 9/14/2016
function [Ifiltered] = gaussfilter(I)
%take size of image matrix
[rowI, colI] =size(I);

%define average mask
mask = zeros(7);
sigma=1;
for row=1:7
    for col=1:7
        x=col-4;
        y=row-4;
        mask(row,col)=(1/sqrt(2*pi*sigma))*exp(-(x^2+y^2)/(2*sigma^2));
        
    end
end
        

%define the size of output matrix
Ifiltered = zeros(rowI, colI);

%iterates rows
for row=4:rowI-4
    %iterates columns 
    for col=4:colI-4
        %fill sub matrix 
        mSub = I(row-3:row+3,col-3:col+3);
        %apply average mask
        mSub = mSub.*mask;
        %assign value to output matrix
        Ifiltered(row,col) = sum(sum(mSub));
    end
end

