function [direction] = startNewContour(points, edges)
contour = 1;
msub = edges(points(1,1,contour)-1:points(1,1,contour)+1,...
    points(1,2,contour)-1:points(1,2,contour)+1);



