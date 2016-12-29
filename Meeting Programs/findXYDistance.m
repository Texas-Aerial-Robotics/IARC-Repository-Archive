function [pMeters] = findXYDistance(height, width, z, p)
% p is an array of points 
fovx = 60;
fovy = 60;
alphax = fovx/2;
alphay = fovy/2;

x = z*tand(alphax);
y = z*tand(alphay);
dx = x*(p(:,1) - (width/2)) / (width/2);
dy = y*(p(:,2) - (height/2)) / (height/2);
pMeters = [dx, dy];



