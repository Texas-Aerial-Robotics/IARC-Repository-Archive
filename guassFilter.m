%the purpose of this user defined function is to apply a 3x3 guass filters to
%   images
%   the output for this function is the filtered matrix of pixels
%   last modified by Eric Johnson on 6/27/16
function [Ifiltered ] = guassFilter(I) 
[m,n] = size(I);
Ifiltered = zeros(m,n);
dimension = 3;
sigma = 2;
%generated 3x3 guassian mask 
guassMask = createGuassMask(dimension, sigma);

%p incriments column being used -->
%   loops from pixel 2 to end pixle minus 1 
for p=2:n-1
    %q incriments row being used 
    %   loops from row 2 to 2nd to last row
    for q=2:m-2
        mSub = zeros(3);
        %creates 3x3 array of surrounding pixels 
        %   incriments from left to right -->
        for x=-1:1
            %   incriments from bottom to top
            for y=-1:1
                mSub(y+2,x+2) = double(I(q+y,p+x));
            end
        end
        %applies guassian mask
        mSub = mSub*guassMask;
        %sum mSub
        sum=0;
        %the sum of the filtered matrix is the averge intesity of the
        %   center pixle 
        for x=1:3
           for y=1:3
               sum= sum + mSub(y,x);
           end
        end
        % assign averged pixel intensity to the filtered image 
        Ifiltered(q,p) = sum;
        
    end
end



