%the purpose of this script is to calculate the robots positions overtime
% last modified 5/17/2016 2:49am by Eric Johnson
clc; clear all
R = 8;
t = 0;
v = .25; %m/s

for t=0:1:180
    theta = (v*t)/R;
    y(t+1) = R*sin(theta);
    x(t+1) = R*cos(theta);
    
end
plot(x,y)
