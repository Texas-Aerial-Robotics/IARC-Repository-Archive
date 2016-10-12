function expanded = expandImage(I)
gEven = createGuassian(4);
gOdd = createGuassian(5);
[height, width] = size(I);
expanded  = zeros(2*height, 2*width);

odd = convolution1(I, gOdd);
for col=1:height
    for row=1:width
       expanded(col*2-1,row*2-1) = odd(col, row);   
    end
end
[h,w] = size(gEven);
 mSub = zeros(h,w);
for col=1:height
   for row=1:width
      mSub = I(
   end
end

