num=7;
sigma=1;
mask=zeros(num,num);
shift=(num-1)/2;
for a=1:num
    x=a-1-shift;
    for b=1:num
        y=b-1-shift;
        mask(a,b)=(-1/(pi*sigma^4))*(1-((x^2+y^2)/(2*sigma^2)))...
            *exp(-(x^2+y^2)/(2*sigma^2));
        
    end
end
x=-3:3;
y=-3:3;
[X,Y]=meshgrid(x,y);
figure(1)
mesh(X,Y,mask)