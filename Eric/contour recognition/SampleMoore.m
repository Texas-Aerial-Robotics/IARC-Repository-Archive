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
        %left up    up   right right down down left   
moves = [0,-1; -1,0; -1,0; 0,1; 0,1; 1,0; 1,0; 0,-1];
points = zeros(1,2);
flag = true;
for row=height:-1:1
   for col=1:width
      if I(row,col) == 0
         %start new contour
         pointN = 1;
         points(pointN,:) = [row,col];
         search = true;
         searchPoint =  points(pointN,:) + [1,0];
         directionLast = 1;
         pointN = 2;
         
         while search == true
            %determain move 
            for k=1:6
                searchPoint = moves(k,:) + searchPoint;
                if I(searchPoint(1),searchPoint(2)) == 0
                    disp('found')
                    points(pointN,:) = searchPoint
                    searchPoint = searchPoint - moves(k,:);
                    pointN = pointN +1;
                    moves = [moves(k+1:8,1:2); moves(1:k,1:2)]
                    %just for now should be if statement
                    if searchPoint == points(1,:)
                    search = false;
                    flag = false;
                    end
                    break
                end
            end
         end
      end
      if flag == false 
         break 
      end
   end
   if flag == false
       break
   end
end


