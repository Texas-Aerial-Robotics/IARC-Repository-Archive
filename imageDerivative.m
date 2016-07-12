%the purpose of this user defined function is to take the derivative of an
%   image
%   last modified by Eric Johnson 6/27/2016
function [dx,dy] = imageDerivative(I)

[m,n] = size(I);
dx = zeros(m,n);
dy = zeros(m,n);
DMaskx = [1,0,-1;2,0,-2;1,0,-1];
DMasky = [1,2,1;0,0,0;-1,-2,-1];

%take derivative in x direction
for p=2:n-1
    for q=2:m-1
        mSub = zeros(3);
        for x=-1:1
            for y=-1:1
                msub(y+2,x+2) = I(q+y,p+x);
            end
        end
        msub = DMaskx .* msub;
        delta = msub(:,1) + msub(:,3);
        sum=0;
        for i=1:3
           sum  = sum + delta(i);
        end
        dx(q,p) = (1/3)*sum;
        
    end
end
%find derivative in y direction 
for p=2:n-1
    for q=2:m-1
        mSub = zeros(3);
        for x=-1:1
            for y=-1:1
                msub(y+2,x+2) = I(q+y,p+x);
            end
        end
        msub = DMasky .* msub;
        delta = msub(1,:) + msub(3,:);
        sum=0;
        for i=1:3
           sum  = sum + delta(i);
        end
        dy(q,p) = (1/3)*sum;
        
    end
end

