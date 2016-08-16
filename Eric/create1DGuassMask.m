%the purpose of this user defined function is to generate a 1D guassian mask 
%   the input variables are an odd iteger size, and the standard deviation
%   the output for this user defined function is a 1D guassian mask
%   last modified 7/19/16

function [GuassMask1D] = create1DGuassMask(dimension, sigma)

if mod(dimension,2)== 1
    %finds the radius of pixles around the center
    r = (dimension-1)/2;
    %for loop incriments through the positions of the mask from -radius to
    %   +radius left to right -->
    %   body of loop fills mask with guassian evaluations 
    for x=-r:r
       
           GuassMask1D(1,x+r+1) = exp((-1*(x^2))/(2*sigma^2));
    end
% if the input size is even the the user defined function will return an
%   error
else
    error('size of guass mask must be an odd integer');
end