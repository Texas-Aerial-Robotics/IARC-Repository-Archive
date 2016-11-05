function [cFill] = findContours(I)



[height, width] =  size(I);
direction = [8, 1, 2; 7, 9, 3; 6, 5, 4];
% directoin of A2L  1, 2, 3... 8 
add2Last = [-1, 0; -1, 1; 0, 1; 1,1; 1,0; 1,-1; 0,-1; -1,-1];
points = zeros(1,2);
numContours = 0;

stop = false;
cFill = zeros(height, width, 10);
for row=1:height
    for col=1:width
        lastMove = 7;
        
        if I(row, col) == 0
            %start new contour
            numContours = numContours +1;
            points = zeros(1,2);
            numPoints =1;
            points(numPoints,:) = [row, col];
            
            for i=1:10000
            
                if points(numPoints,1) == points(1,1) && points(numPoints,2) == points(1,2) && numPoints > 1 
                    stop =true
                    break
                end
                msub = I(points(numPoints,1)-1:points(numPoints,1)+1, points(numPoints,2)-1:points(numPoints,2)+1);
                %for purpose of testing
                %order the submatrix in the order of the clockwise search
                for k=1:9
                    if k ~= 5
                        pmSub(direction(k)) = msub(k);
                    end
                    
                end
                
                %assign find and assign next point to the contour
                for p=0:7
                    
                    if pmSub(lastMove +p) == 0
                        numPoints = numPoints + 1;
                        points(numPoints,:) =  points(numPoints-1,:) + add2Last(lastMove+p,:);
                        %assign new last move
                        lastMove = lastMove +p;
                        if lastMove == 1 || lastMove == 2
                            lMN = 7;
                        end
                        if lastMove == 3 || lastMove == 4
                            lMN = 1;
                        end
                        if lastMove == 5 || lastMove == 6
                            lMN = 3;
                        end
                        if lastMove == 7 || lastMove == 8
                            lMN = 5;
                        end
                        lastMove = lMN;
                        
                        break
                    end
                    
                    if lastMove+p == 8
                        lastMove = -p;
                    end
                    
                end
                
            end %end while
            contour = zeros(height, width);
            
            for k=1:length(points)
                contour(points(k,1), points(k,2)) =1;
            end
            
            %fill contour level
            cFill(:,:,numContours) = imfill((contour),'holes');
            for r=1:height
               for c=1:width
                   if cFill(r,c, numContours) == 1
                      I(r,c) = 1; 
                   end
               end
            end
            stop = false;
        end
        if stop == true
            break
        end
    end
    if stop == true
        break
    end
end
