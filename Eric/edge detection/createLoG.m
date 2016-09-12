%the purpose of this user defined function is to create a LoG Mask

function LoG = createLoG(dimension, sigma) 

if mod(dimension,2)==0
    error('size of filter must be odd!!!')
end
shift = (dimension-1)/2;
LoG = zeros(dimension);
for row=1:dimension
    for col=1:dimension
       LoG(row, col) = (((col-shift-1)^2 + (row-shift-1)^2 -2*sigma^2)/(sigma^4))...
           *exp(-1*((col-shift-1)^2 + (row-shift-1)^2 )/ 2*sigma^2);
       
   end
end
