%the purpose of this script is to rotate a image an arbatrary angle 
%   created 9/29/2016
clc; clear all
close all

I = imread('colorRoomba.jpg');
figure(1), imshow(I);
I = double(I);

%define rotation
theta = 40;
[height, width,d] = size(I);

%make sure there is a center pixle 
if mod(width,2) == 0
   A = zeros(height,1,3);
   I = [I,A];
end
[height, width,d] = size(I);

if mod(height,2) == 0
   A = zeros(1,width,3); 
   I = [I;A];
end
[height, width,d] = size(I);


%define size of background
halfDiag = ceil(sqrt( ((width-1)/2)^2 + ((height-1)/2)^2));

if width > height
    delta = halfDiag - ((height-1)/2); 
    dim1 = 2*delta + height;
    dim2 = 2*delta +width;
    IB = ones(dim1, dim2,3);
    IB = IB*230;
end
if height > width
    delta = halfDiag - ((width-1)/2);
    dim1 = 2*delta + width;
    dim2 = 2*delta + height;
    IB = ones(dim1, dim2,3);
    IB = IB*230;
end

IB(delta+1:delta+height, delta+1:delta+width,1:3) = I;
figure(2), imshow(mat2gray(IB))

%define origin in center of pic 
x0 = ((width-1)/2)+1;
y0 = ((height-1)/2)+1;
origin = [x0+delta, y0+delta];
%define rotation transform
rotate = [cosd(theta), sind(theta); -sind(theta), cosd(theta)];
%define rotated image size
[Ny, Nx,d] = size(IB);
IR = ones(Ny, Nx,3);
IR = IR*230;
for z=1:3
    for row=delta+1:height+delta
        for col=delta+1:width+delta
            p = [col-origin(1); row-origin(2)];
            pPrime = rotate*p;
            %over sample
            for k=-2:2
                IR(round(pPrime(2))+origin(2)+k,round(pPrime(1)+origin(1))+k,z) = IB(row,col,z);
            end
        end
    end
end
figure(3), imshow(uint8(IR))


