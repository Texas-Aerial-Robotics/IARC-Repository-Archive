function Icon = adjustContrast(I)
[height, width] =size(I);

hist = zeros(1,256);

for row=1:height
   for col=1:width
      hist(1, I(row,col)+1) =  hist(1, I(row,col)+1) + 1;
       
   end
end
histN = (1/sum(hist)) * hist;
Icon = zeros(height, width);
for row=1:height
   for col=1:width
      Icon(row, col) =  histN(1, I(row,col)+1)*255;
       
   end
end
