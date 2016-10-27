%the purpose of this script is to demonstrate the freeman chain algorithm 
I = imread('LHc.jpg');
figure(1), imshow(I)
I = double(I);

edges = detectEdges(I);
figure(2), imshow(mat2gray(edges))
[height, width] = size(edges);
contour = 1;
for row=1:2
    for col=1:2
        if edges(row,col) == 0
            %start new freeman chain
            points = [row, col, contour];
            [msub] = startNewContour(points, edges)
            search = true;
            numPoints = 1;
            p=1;
            q=1;
            for i=j:p:3
               for i=1:q:3
                   msub(i,j) 
               end
               
            end
%             while search == true
%                  msub = edges(points(1,1,contour)-1:points(1,1,contour)+1, points(1,2,contour)-1:points(1,2,contour)+1);
%                 if numPoints == 1
%                     
%                    for k=1:9
%                        if msub(k) == 0
%                           direction = k; 
%                           break
%                        end
%                    end
%                    
%                 end
%                 search = false;
%             end
            
        end
    end
end


