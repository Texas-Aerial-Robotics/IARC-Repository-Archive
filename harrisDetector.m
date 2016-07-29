%the purpose of this script is to detect Harris Points 
%   last modified 6/16/16
clc; clear all 
close all


%triangleTest.png
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

%detect edges 
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

figure(3), imshow(im2uint8(edges))

%use built in harris detector to varify results
C = corner(I);
figure(4), imshow(mat2gray(I));
hold on
plot(C(:,1), C(:,2), 'r*');

%make 3D derivative matrix
% Ixy = dx*dy;
% Ix2 = dx.^2;
% Iy2 = dy.^2;
% k = 0.000000000000000000000000000000004;
% R11 = (Ix2.*Iy2 - Ixy.^2) - k*(Ix2 + Iy2).^2;
% %R11=(1000/max(max(R11)))*R11;
% R=R11;
% harris = ones(m,n);
% sum =1;
% for p=1:n
%     for q=1:m
%         if R(p,q) > -.9
%             B(sum,1) = p;
%             B(sum,2) = q;
%             disp('found');
%             harris(q,p) = 0;
%             sum = sum +1;
%         end
%     end
% end
%cycle derivative matrix
%adjusts column 
dXY = cat(3, dx, dy)
count =0;
sum=1;
for p=1:n
    %adjusts row
    for q=1:m
        
        
        A = zeros(2,2);
        %fill least square matrix
        for i=1:2
            for ii=1:2
                A(i,ii) = abs(dXY(q,p,i)) * abs(dXY(q,p,ii));
            end
        end
        [vector, value] = eig(A);
        if value(1)>0 && value(4) > 0
            count = count +1;
            value
            R = det(A) - .00000000000000005*(trace(A))^2;
            
            
            
            if R > 0
                
                B(sum,1) = p;
                B(sum,2) = q;
                disp('found');
                harris(q,p) = 0;
                sum = sum +1;
            end
        end
    end
end
sum


figure(5), imshow(mat2gray(I))
hold on
plot(B(:,1), B(:,2), 'b*');

