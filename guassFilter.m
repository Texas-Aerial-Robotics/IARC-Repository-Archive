%the purpose of this user defined function is to apply guass filters to
%   images
%   last modified by Eric Johnson on 6/27/16
function [Ifiltered ] = guassFilter(I) 
[m,n] = size(I);
Ifiltered = zeros(m,n);
dimension = 3;
sigma = 2;
guassMask = createGuassMask(dimension, sigma);
for p=2:n-1
    for q=2:m-2
        mSub = zeros(3);
        for x=-1:1
            for y=-1:1
                mSub(y+2,x+2) = double(I(q+y,p+x));
            end
        end
        mSub = mSub*guassMask;
        %sum mSub
        sum=0;
        for x=1:3
           for y=1:3
               sum= sum + mSub(y,x);
           end
        end
        Ifiltered(q,p) = sum;
        
    end
end



