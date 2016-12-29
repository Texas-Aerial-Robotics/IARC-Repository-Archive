function [pMeters] = findXYDistance(height, width, z, p)
fovx = 60;
fovy = 60;
alphax = fovx/2;
alphay = fovy/2;

posx=p(1)-width/2;
posy=height/2-p(2);
x = z*tand(alphax); %because square for this example
y = z*tand(alphay);
dx = x*(posx / (width/2));
dy = y*(posy/ (height/2));
pMeters = [dx, dy];

