function [Ireduced] = compressIm(I)
[height, width] = size(I);

if mod(height, 2) == 1
   rowAdd = zeros(1,width);
   I = [I; rowAdd];
end
[height, width] = size(I);
if mod(width, 2) == 1
    colAdd = zeros(height, 1);
    I = [I, colAdd];
end
[height, width] = size(I);
mask = createGuassian(5);
Ismooth = I;%= convolution1(I, mask);

Ireduced = zeros(height/2, width/2);
for row=1:height/2
   for col=1:width/2
       Ireduced(row, col) = Ismooth(row*2, col*2);
   end
    
end

