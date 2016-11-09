function [pMeters] = findXYDistance(height, width, z, p)
fovx = 60;
fovy = 60;
alphax = fovx/2;
alphay = fovy/2;

x = z*tand(alphax); %because square for this example
y = -z*tand(alphay);
dx = x*(p(:,2)-(width/2)) / (width/2);
dy = y*(p(:,1)-(height/2))/ (height/2);
pMeters = [dx, dy];

