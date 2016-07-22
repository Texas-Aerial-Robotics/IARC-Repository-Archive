%Gaussian Distribution Test
%Testing and plotting a 2-D gaussian distribution

sigma=1;

x=-3:0.1:3;
y=x;
[X,Y]=meshgrid(x,y);
Z=zeros(61);
for i=1:61
    for j=1:61
        Z(i,j)=(1/sqrt(2*pi*sigma))*exp(-(X(i,j)^2+Y(i,j)^2)/(2*sigma^2));
    end
end

figure(1)
mesh(X,Y,Z)