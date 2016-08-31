function [I]=Gauss_special(M,num,sigma,k)

%difference of gaussian function
%purpose is to create a filter for images that can be used for edge 
%detection

%first take in and size image M
[row,col]=size(M);
I=zeros(row,col);
M=double(M);
%use num as size of filter
if mod(num,2)==0
    error('size of filter must be odd!!!')
end
%sigma will be used in calculation of laplacian of gaussian

%now creating mask
mask=zeros(num,num);
shift=(num-1)/2;
for a=1:num
    x=a-1-shift;
    for b=1:num
        y=b-1-shift;
        mask(a,b)=(1/((2*pi)*(k*sigma)^2))*exp(-(x^2+y^2)/(2*k^2*sigma^2));
        
    end
end
%now to apply mask
%first create indeces

I=conv2(M,mask,'same');

I=mat2gray(I);