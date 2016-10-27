clc; clear all
I1 = [1,1,1,1,1,1,1];
I2 = [1,1,0,0,1,1,1];
I3 = [1,0,1,1,0,1,1];
I4 = [1,0,1,1,1,0,1];
I5 = [1,1,0,0,0,1,1];
I6 = [1,1,1,1,1,1,1];
I = [I1; I2; I3; I4; I5; I6];

figure(1), imshow(I)

[height, width] =  size(I);
direction = [8, 1, 2; 7, 9, 3; 6, 5, 4];
% directoin of A2L  1, 2, 3... 8 
add2Last = [-1, 0; -1, 1; 0, 1; 1,1; 1,0; 1,-1; 0,-1; -1,-1];
points = zeros(1,2);


stop = false;
for row=1:height
    for col=1:width
        lastMove = 7;
        
        if I(row, col) == 0
            %start new contour
            numPoints =1;
            points(numPoints,:) = [row, col];
            
            %while 
            
            msub = I(row-1:row+1, col-1:col+1);
            stop = true; %for purpose of testing
            %order the submatrix in the order of the clockwise search
            for k=1:9
                if k ~= 5
                    pmSub(direction(k)) = msub(k);
                end
                
            end
            
            %assign find and assign next point to the contour
            for p=0:7
                if lastMove+p == 8
                    lastMove = -p+1;
                end
                if pmSub(lastMove +p) == 0
                    numPoints = numPoints + 1;
                    points(numPoints,:) =  points(numPoints-1,:) + add2Last(lastMove+p,:);
                    %need to add Last Move adjustment
                    break
                end
            end
            
        end
        if stop == true
            break
        end
    end
    if stop == true
        break
    end
end
msub
pmSub

