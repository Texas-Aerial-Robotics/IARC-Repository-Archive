vr = .33 ;

vq = input('Velocity of the quad is ');

thetar = input('Enter the angle the roomba makes with the x axis of the quad: ')

coordx = input('x coordinate of the roomba: ');

coordy = input('y coordinate of the roomba: ' );

cthetar = coordx/coordy;
sthetar = coordy/coordx;

predist = coordx^2 + coordy^2
truedistance = sqrt(predist);

time=[];
angle = [];

for t= .1:.1:10
    for thetau = 0:pi/100:pi
        xq = 5*cos(thetau);
        xr = .33*cos(thetar)*t+coordx
        yq = 5*sin(thetau)*t
        yr = coordy + .33*sin(thetar)*t
        if 0<=xq - xr<.01 && 0<=yq - yr <.01
            c = t
            time = [time, c];
            angle = [angle, thetau];
            break;
            break;
        end;
    end;
end;

turnangle = angle(1);

fprintf('The angle the quad needs to turn is: %d', turnangle);

thetau = turnangle;


