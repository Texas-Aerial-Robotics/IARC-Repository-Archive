%the purpose of this script is to detect Harris Points 
%   last modified 6/16/16
clc; clear all 
close all

I = imread('roomba.jpg');
[height,width,z1] = size(I);
figure(1), imshow(I)
info = imfinfo('roomba.jpg')
I = double(I);
[Ifiltered ] = guassFilter(I);
I = Ifiltered;
figure(2), imshow(im2uint8(I))

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
figure(2), imshow(im2uint8(edges))

%make 3D derivative matrix 
dXY = cat(3, dx, dy);
threshold = 90;
closeEigen = 5;
harris = ones(m,n); 
%cycle derivative matrix 
%adjusts column 
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
      R = det(vector) - (trace(vector))^2;
      if R > 0
            harris(q,p) = 0;
      end 
   end
end
figure(3), imshow(im2uint8(harris))
sum = 0; 
for i=1:(m*n)
    if harris(i) == 0
       sum = sum +1; 
    end
end

