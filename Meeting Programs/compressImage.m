function [Icompressed] = compressImage(I)
[height, width] = size(I);
if mod(height, 2) == 1
    endRow = zeros(1,width);
    I = [I; endRow];
end
[height, width] = size(I);
if mod(width, 2) == 1
    endCol = zeros(height, 1);
    I = [I, endCol];
end
[height, width] = size(I);

gMask = createGuassian(5);
If = convolution1(I, gMask);

Icompressed = zeros(height/2, width/2);
for row=2:2:height
    for col=2:2:width
       Icompressed(row/2,col/2) = If(row, col); 
    end
end
    
    




