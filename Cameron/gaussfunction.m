function gaussMask = gaussfunction(dimension)
gaussMask = zeros(dimension);
sigma = 1;
for row = 1:dimension
    for col = 1:dimension
        x=col-((dimension+1)/2);
        y=row-((dimension+1)/2);
        gaussMask(row,col)=(1/sqrt(2*pi*sigma))*exp(-(x^2+y^2)/(2*sigma^2));
    end
end