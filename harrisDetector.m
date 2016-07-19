%the purpose of this script is to detect Harris Points 
%   last modified 6/16/16
clc; clear all 
close all

I = rgb2gray(imread('triangleTest.png'));
[height,width,z1] = size(I);
figure(1), imshow(I)
info = imfinfo('triangleTest.png')
I = double(I);
[Ifiltered ] = guassFilter(I);
I = Ifiltered;
size(I)
figure(2), imshow(mat2gray(I))

[dx,dy] = imageDerivative(I);



DMag = sqrt((dx.^2) + (dy.^2));
threshold = 80;
[m,n] = size(I);
edges = ones(m,n);
for p=1:n
   for q=1:m
      if DMag(q,p) > threshold
          edges(q,p) = 0;
      end
   end
end
C = corner(I);
figure(3), imshow(im2uint8(edges))
figure(4), imshow(mat2gray(I));
hold on
plot(C(:,1), C(:,2), 'r*');

%make 3D derivative matrix 
dXY = cat(3, dx, dy);
harris = ones(m,n); 
%cycle derivative matrix 
%adjusts column 
count =0;
for p=1:n
    %adjusts row
   for q=1:m
       A = zeros(2,2);
       %fill least square matrix
      for i=1:2
         for ii=1:2
             A(i,ii) = dXY(q,p,i) * dXY(q,p,ii);
         end
      end
      [vector, value] = eig(A); 
      if abs(value(1))>0 && abs(value(4)) > 0
          count = count +1;
      end
      R = (value(1)*value(4)) - .04*((value(1)+value(4))^2)
      if R > 0
          disp
            harris(q,p) = 0
      end 
   end
end

sum = 0; 
for i=1:(m*n)
    if harris(i) == 0
       sum = sum +1; 
    end
end
figure(5), imshow(mat2gray(harris))
count
