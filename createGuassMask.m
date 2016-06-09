%the purpose of this user defined function is to generate a guassian mask 
%   the input variables are an odd iteger size, and the standard deviation
%   last modified 6/7/16

function [guassMask] = createGuassMask(dimension, sigma)

if mod(dimension,2)== 1
    r = (dimension-1)/2;
    for x=-r:r
        for y=-r:r
            guassMask(y+r+1,x+r+1) = (1/(2*pi*sigma^2))*exp((-1*(x^2+y^2))/(2*sigma^2));
        end
    end
else
    error('size of guass mask must be an odd number');
end


