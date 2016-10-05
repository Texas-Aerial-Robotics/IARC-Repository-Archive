%the purpose of this userdefined function is to compress an image 
%   created 10/4/2016

function [Icom] = compressImage(I)

[height, width] = size(I);

[gMask] = createGuassian(5);
if mod(width,2) == 1
    endCol = zeros(height, 1);
    I = [I, endCol];
end
[height, width] = size(I);
if mod(height,2) == 1
    endRow = zeros(1, width);
    I = [I; endRow];
end
[height, width] = size(I);
Icom = zeros(height/2, width/2);
If = convolution1(I, gMask);
for row=2:2:height
   for col=2:2:width
      Icom(row/2,col/2) = If(row, col); 
   end
end




