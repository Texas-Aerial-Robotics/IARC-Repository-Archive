%the purpose of this user defined function is to perform edge detection
%   using canny edge detection
%   outputs binary image
function [edges] = detectEdges(I)

%define image derivative masks 
dx = [1, 0, -1; 1,0,-1;1,0,-1];
dx = dx/3;
dy = [1,1,1;0,0,0;-1,-1,-1];
dy = dy/3;

%apply derivative masks to image 
[Dx] = convolution1(I, dx);
[Dy] = convolution1(I, dy);

%take a magnitude of derivative 
mag = sqrt(Dx.^2 + Dy.^2);

[height, width] = size(I);
%make new matrix for edges image 
edges = ones(height, width);
%define edge threshold 
threshold = 70;
%apply threshold to every indice 
for col=1:height
   for row=1:width
       if mag(col,row) > threshold
           edges(col, row) = 0;
       end
   end
end







