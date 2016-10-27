function [msub] = startNewC(points)

msub = edges(points(1,1,contour)-1:points(1,1,contour)+1,...
    points(1,2,contour)-1:points(1,2,contour)+1);

