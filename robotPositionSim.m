%the purpose of this script is to calculate the robots positions overtime
% last modified 5/17/2016 2:54pm by Eric Johnson
clc; clear all
R = 4; %radius for troll bots
t = 0; %time variable
h = .5; %step size for time 
v = .25; %m/s
rVector =0;% distance travled
direction = -1; % simulates 180 turns

% loops at h interval to ten mins 
%   body of loop calculates the positions of bots
x0 = R*sin(pi/4);
y0 = R*cos(pi/4);
yb1(1) =y0;
xb1(1) =x0;
for t=0:h:600
    %troll bot 1
    theta = (v*t)/R;
    yt1((1/h)*t + 1) = R*sin(theta);
    xt1((1/h)*t + 1) = R*cos(theta);
    
    %bot 1
    thetaBot1 = pi/4;
    
    rVector = v*h ;
    yb1((1/h)*t + 2) = direction*rVector*sin(thetaBot1) + yb1((1/h)*t+1);
    xb1((1/h)*t + 2) = direction*rVector*cos(thetaBot1) + xb1((1/h)*t+1);
    if mod(t,20) == 0
       direction = direction * -1;
    end
    deltaT1B1y = yb1((1/h)*t + 2)-yt1((1/h)*t + 1);
    deltaT1B1x = xb1((1/h)*t + 2)-xt1((1/h)*t + 1);
    colitionRT1B1 = sqrt((deltaT1B1y^2) + (deltaT1B1x^2));
    if colitionRT1B1 < .68
       direction = direction * -1;
       disp('colition')
       t
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

