%the purpose of this script is to calculate the robots positions overtime
% last modified 5/18/2016 2:48pm by Eric Johnson
clc; clear all
RT = 5; %radius for troll bots
t = 0; %time variable
h = .5; %step size for time 
v = .25; %m/s
rVector =0;% distance travled
direction = -1*ones(1,10); % simulates 180 turns
R=1; %starting radius for normal bots

%loops 10 times
%   the body of the for loop set the intial postiotions of the bots
for i=1:10
    dtheta0 = 2*pi / 10;
    x0Bot(i) = R*cos(dtheta0*i);
    y0Bot(i) = R*sin(dtheta0*i);
    yBots(1,i) =y0Bot(i);
    xBots(1,i) =x0Bot(i);
end

% loops at h interval to ten mins
%   body of loop calculates the positions of bots
for t=0:h:600
    if mod(t,20) == 0
        disp('time')
        direction = direction * -1;
    end
    %troll bots positions
    for n=1:4
        theta = -(v*t)/RT;
        theta0 = (2*pi/4);
        yt1((1/h)*t + 2,n) = RT*sin(theta + theta0*n);
        xt1((1/h)*t + 2,n) = RT*cos(theta+ theta0*n);
    end
    
    
    %bot positions
    %%%
    
    %loops ten times 
    %   body of loop calculates the position for the ten bots at the
    %   specific t value
    for k=1:10
        thetaBot = dtheta0*k;
        rVector = v*h ;
        yBots((1/h)*t + 2,k) = direction(k)*rVector*sin(thetaBot) + yBots((1/h)*t+1,k);
        xBots((1/h)*t + 2,k) = direction(k)*rVector*cos(thetaBot) + xBots((1/h)*t+1,k);
    end
    
    for ii=1:4
        %loops ten for ten bots
        %   body of the loop cheks for collisions between bots
        for i=1:10
            deltaRy(i) = yBots((1/h)*t + 2, i)-yt1((1/h)*t + 1,ii);
            deltaRx(i) = xBots((1/h)*t + 2, i)-xt1((1/h)*t + 1,ii);
            collition(i) = sqrt((deltaRy(i)^2) + (deltaRx(i)^2));
            if collition(i) < .68
                direction(i) = direction(i) * -1;
                disp('collition')
                t
                i
                ii
            end
        end
    end
  
end


figure(1)
axis([-10,10,-10,10,]);
hold on
for i=1:length(xt1)
    for k=1:4
        plot(xt1(i,k),yt1(i,k),'ro','markersize', 6) 
    end
    for n=1:10
        plot(xBots(i,n),yBots(i,n),'bo','markersize', 6)
    end
    hold on
    drawnow
    cla
end
hold off

