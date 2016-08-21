function [I]=LoG_filter(M,num)

%laplacian of gaussian function
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
sigma=(num-1)/6;
%now creating mask
mask=zeros(num,num);
shift=(num-1)/2;
for a=1:num
    x=a-1-shift;
    for b=1:num
        y=b-1-shift;
        mask(a,b)=(-1/(pi*sigma^4))*(1-((x^2+y^2)/(2*sigma^2)))...
            *exp(-(x^2+y^2)/(2*sigma^2));
        
    end
end
%now to apply mask
%first create indeces

for x=(1+shift):(row-shift)
    
    for y=(1+shift):(col-shift)
        
        %now apply mask to each pixel
        %need to create a mini matrix to be changed by mask
        mini=M((x-shift):(x+shift),(y-shift):(y+shift));
        new=mini.*mask;
        sum1=sum(new);
        newpix=sum(sum1);
        I(x,y)=newpix;
        
    end
end

I=mat2gray(I);

    
    
    
    
    
    