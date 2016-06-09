%the purpose of this script is to detect edges in images 
%   last modified 6/7/16
clc; clear all 
close all

width = 1500;
height = 1496; 

I = imread('roomba.jpg');
figure(1), imshow(I)
info = imfinfo('roomba.jpg')
for rgb=1:3
    for p=1:width
        for q=1:height
            I(q,p,rgb) = I(q,p,rgb) + 40*randn(1);
        end
    end
end
figure(2), imshow(I)

dimension=3;
sigma=2;
guassMask = createGuassMask(dimension, sigma)

for p=2:width-1
    for q=2:height-1 
        mSub = zeros(3);
        for x=-1:1
            for y=-1:1
                mSub(y+2,x+2) = double(I(q+y,p+x));
            end
        end
        mSub = mSub*guassMask;
        %sum mSub
        sum=0;
        for x=1:3
           for y=1:3
               sum= sum + mSub(y,x);
           end
        end
        Ifiltered(q,p) = round(sum);
        
    end
end
figure(3), imshow(uint8(Ifiltered))

DMaskx = [1,0,-1;2,0,-2;1,0,-1];
DMasky = [1,2,1;0,0,0;-1,-2,-1];
[m,n] = size(Ifiltered);
dx = zeros(m,n);
dy = zeros(m,n);
%take derivative in x direction
for p=2:n-1
    for q=2:m-1
        mSub = zeros(3);
        for x=-1:1
            for y=-1:1
                msub(y+2,x+2) = Ifiltered(q+y,p+x);
            end
        end
        msub = DMaskx .* msub;
        delta = msub(:,1) + msub(:,3);
        sum=0;
        for i=1:3
           sum  = sum + delta(i);
        end
        dx(q,p) = (1/3)*sum;
        
    end
end
%find derivative in y direction 
for p=2:n-1
    for q=2:m-1
        mSub = zeros(3);
        for x=-1:1
            for y=-1:1
                msub(y+2,x+2) = Ifiltered(q+y,p+x);
            end
        end
        msub = DMasky .* msub;
        delta = msub(1,:) + msub(3,:);
        sum=0;
        for i=1:3
           sum  = sum + delta(i);
        end
        dy(q,p) = (1/3)*sum;
        
    end
end

DMag = sqrt((dx.^2) + (dy.^2));
threshold = 80;

edges = ones(m,n);
for p=1:n
   for q=1:m
      if DMag(q,p) > threshold
          edges(q,p) = 0;
      end
   end
end
figure(4), imshow(im2uint8(edges))

