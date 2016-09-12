%the purpose of this user defined function is to perform convolution
%   between a mask and matrix I
%   last modified 9/12/2016

function Icon = convolution(guassMask, I)
[Irow, Icol] = size(I);
[maskRow, maskCol] = size(guassMask);
Icon = zeros(Irow, Icol);
mR = (maskRow-1)/2;
for row=mR+1:Irow-(mR+1)
   for col=mR+1:Icol-(mR+1)
       mSub = I(row-mR:row+mR, col-mR:col+mR);
       conM = guassMask.*mSub;
       Icon(row,col) = sum(sum(conM));
   end
end

