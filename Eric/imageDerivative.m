%the purpose of this user defined function is to take the derivative of an
%   image
%   the input for this user defined function is the matrix of image
%   intensities 
%   the outputs for this user defined function is the derivitve of the
%   pixles in the x and y direction 
%   last modified by Eric Johnson 6/27/2016
function [dx,dy] = imageDerivative(I)

[m,n] = size(I);
dx = zeros(m,n);
dy = zeros(m,n);
DMaskx = [1,0,-1;1,0,-1;1,0,-1];%[1,0,-1;2,0,-2;1,0,-1];
DMasky = [1,1,1;0,0,0;-1,-1,-1];%[1,2,1;0,0,0;-1,-2,-1];

%take derivative in x direction

%p incriments column being used -->
%   loops from pixel 2 to end pixle minus 1 
for p=2:n-1
    %q incriments row being used 
    %   loops from row 2 to 2nd to last row
    for q=2:m-1
        msub = zeros(3);
        %creates 3x3 array of surrounding pixels 
        %   incriments from left to right -->
        for x=-1:1
            %   incriments from bottom to top
            for y=-1:1
                msub(y+2,x+2) = I(q+y,p+x);
            end
        end
        %applies center wieghted row mask for more percision 
        msub = DMaskx .* msub;
        %take change in pixle intensity between the 3 columns
        %   **note derivitive masks wieghts the center column to zero**
        delta = msub(:,1) + msub(:,3);
        sum=0;
        
        %sums the changes in intesity of the 3 rows
        for i=1:3
           sum  = sum + delta(i);
        end
        %averages the change in intensity betweent the 3 rows
        dx(q,p) = (1/3)*sum;
        
    end
end
%find derivative in y direction

%p incriments column being used -->
%   loops from pixel 2 to end pixle minus 1 
for p=2:n-1
    %q incriments row being used 
    %   loops from row 2 to 2nd to last row
    for q=2:m-1
        msub = zeros(3);
        %creates 3x3 array of surrounding pixels 
        %   incriments from left to right -->
        for x=-1:1
            %   incriments from bottom to top
            for y=-1:1
                msub(y+2,x+2) = I(q+y,p+x);
            end
        end
        %applies center wieghted column mask for more percision 
        msub = DMasky .* msub;
        %take change in pixle intensity between the 3 rows
        %   **note derivitive masks wieghts the center column to zero**
        delta = msub(1,:) + msub(3,:);
        sum=0;
        %sums the changes in intesity of the 3 columns
        for i=1:3
           sum  = sum + delta(i);
        end
        dy(q,p) = (1/3)*sum;
        
    end
end

