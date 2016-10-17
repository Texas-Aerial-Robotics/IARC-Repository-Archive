%the purpose of this script is to approximate the contours of an image
clc; clear all
close all

I = imread('LHc.jpg');
figure(1), imshow(I)
I = double(I);
gMask = createGuassian(5);
%I = convolution1(I, gMask);
edges = detectEdges(I);
figure(2), imshow(mat2gray(edges))

percision = 30;

[height, width] = size(edges);
counter = 1;
points= zeros(1,2);
for row=5:height-5
   for col=5:width-5
      if edges(row, col) == 0
            points(counter,1) = row;
            points(counter,2) = col;
            counter = counter +1;
      end
   end
end

%find farthest points
distanceMax = 0;
position = zeros(2,2);
for k=1:length(points)
    for j=1:length(points)
        distance = sqrt( (points(k,1)-points(j,1))^2 + (points(k,2)-points(j,2))^2);
        if distance > distanceMax
            distanceMax = distance;
            position(1,:) = points(k,:);
            position(2,:) = points(j,:);
        end
        
    end
end
line = position; 
distanceMax = 0;
for k=1:length(points)
    deltaCol = position(2,2)- position(1,2);
    deltaRow = position(2,1) - position(1,1);
    m = deltaRow/ deltaCol;
    minv = -deltaCol/deltaRow;
    col2 = (-m*position(2,2) + minv*points(k,2) + position(2,1) - points(k,1))/(minv - m);
    row2 = m*col2 - m*position(2,2) + position(2,1);
    distance = sqrt((col2 - points(k,2))^2 + (row2-points(k,1))^2);
    if distance > distanceMax
        distanceMax = distance;
        position(3,:) = points(k,:);
    end
end
position(4,:) = position(1,:);
figure(3), imshow(mat2gray(edges))
hold on
% plot(position(1,2), position(1,1), 'b*-');
% plot(position(2,2), position(2,1), 'b*-');
% plot(position(3,2), position(3,1), 'r*-');
plot(position(:,2), position(:,1), 'b*-');

plot(col2, row2, 'g*');
hold off




    
