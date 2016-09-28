function [Ifiltered] = convolution1(I)
[rowI, colI] =size(I);
mask = zeros(7);
sigma = 1;
for row = 1:7
    for col = 1:7
        x=col-4;
        y=row-4;
        mask(row,col)=(1/sqrt(2*pi*sigma))*exp(-(x^2+y^2)/(2*sigma^2));
    end
end
Ifiltered = zeros(rowI, colI);

for row=4:rowI-4
   for col=4:colI-4
       mSub = I(row-3:row+3, col-3:col+3);
       mSub = mSub.*mask;
       Ifiltered(row, col) = sum(sum(mSub));
   end
end