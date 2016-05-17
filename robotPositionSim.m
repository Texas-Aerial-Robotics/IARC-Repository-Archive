%the purpose of this script is to calculate the robots positions overtime
% last modified 5/17/2016 2:54pm by Eric Johnson
clc; clear all
R = 4; %radius for troll bots
t = 0; %time variable
h = .5; %step size for time 
v = .25; %m/s
rVector =0;% distance travled
direction = 1; % simulates 180 turns

% loops at h interval to ten mins 
%   body of loop calculates the positions of bots
for t=0:h:60
    %troll bot 1
    theta = (v*t)/R;
    yt1((1/h)*t + 1) = R*sin(theta);
    xt1((1/h)*t + 1) = R*cos(theta);
    
    %bot 1
    thetaBot1 = pi/4;
    x0 = R*sin(pi/4);
    y0 = R*cos(pi/4);
    rVector = v*t;
    yb1((1/h)*t + 1) = direction * rVector*sin(thetaBot1) + y0;
    xb1((1/h)*t + 1) = direction * rVector*cos(thetaBot1) + x0;
    if mod(t,20) == 0
       direction = direction * -1
    end
    
    
end


figure(1)
axis([-10,10,-10,10]);
hold on
for i=1:length(xt1)
    plot(xt1(i),yt1(i),'ro','markersize', 6)
    plot(xb1(i),yb1(i),'bo','markersize', 6)
    hold on
    drawnow
end
hold off

