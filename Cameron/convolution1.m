function [Ifiltered] = convolution1(I, mask)
[rowI, colI] =size(I);
mask = [1, 1, 1; 1,1,1;1,1,1];

mask = mask/9;

[dx, dy] = size(mask);
r=(dx-1)/2;

Ifiltered = zeros(rowI, colI);

for row=r+1:rowI-(r+1)
   for col=(r+1):colI-(r+1)
       mSub = I(row-r:row+r, col-r:col+r);
       mSub = mSub.*mask;
       Ifiltered(row, col) = sum(sum(mSub));
   end
end