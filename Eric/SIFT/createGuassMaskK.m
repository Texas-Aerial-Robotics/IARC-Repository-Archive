%the purpose of this user defined function is to generate a guassian mask 
%   the input variables are an odd iteger size, and the standard deviation
%   the output for this user defined function is a square guassian mask
%   last modified 6/7/16

function [guassMask] = createGuassMaskK(dimension, sigma, k)
%tests if the input size is odd
%   if true the guassian mask is generated 
if mod(dimension,2)== 1
    %finds the radius of pixles around the center
    r = (dimension-1)/2;
    %for loop incriments through the positions of the mask from -radius to
    %   +radius left to right -->
    %   body of loop fills mask with guassian evaluations 
    for x=-r:r
        for y=-r:r
            %for loop incriments through the positions of the mask from -radius to
            %   +radius top to bottom -->
            guassMask(y+r+1,x+r+1) = (1/(2*pi*(k*sigma)^2))...
                *exp((-1*(x^2+y^2))/(2*(k*sigma)^2));
        end
    end
% if the input size is even the the user defined function will return an
%   error
else
    error('size of guass mask must be an odd integer');
end

