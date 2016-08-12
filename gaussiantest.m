%Gaussian Distribution Test
%Testing and plotting a 2-D gaussian distribution

sigma=1;

x=-3:3;
y=x;
[X,Y]=meshgrid(x,y);
Z=zeros(7);
for i=1:7
    for j=1:7
        Z(i,j)=(1/sqrt(2*pi*sigma))*exp(-(X(i,j)^2+Y(i,j)^2)/(2*sigma^2));
    end
end

figure(1)
mesh(X,Y,Z)