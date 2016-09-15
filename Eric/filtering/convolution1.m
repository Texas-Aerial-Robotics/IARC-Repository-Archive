function [Ifiltered] = convolution1(I)
[rowI, colI] =size(I);

mask = [1, 1, 1; 1,1,1;1,1,1];

mask = mask/9;

Ifiltered = zeros(rowI, colI);

for row=2:rowI-1
    for col=2:colI-1
        mSub = I(row-1:row+1,col-1:col+1);
        mSub = mSub.*mask;
        Ifiltered(row,col) = sum(sum(mSub));
    end
end

