%the purpose of this script is to demonstrate the freeman chain algorithm 
I = imread('LHc.jpg');
figure(1), imshow(I)
I = double(I);

edges = detectEdges(I);
figure(2), imshow(mat2gray(edges))
[height, width] = size(edges);
contour = 1;
for row=1:5
   for col=1:5
       if edges(row,col) == 0
          %start new freeman chain
          points = [row, col, contour];
          search = true;
          numPoints = 1;
          while search == true
             if numPoints == 1
             msub = edges(points(1,1,contour)-1:points(1,1,contour)+1, points(1,2,contour)-1:points(1,2,contour)+1);  
             
             end
             search = false;  
          end
         
       end
   end
end


