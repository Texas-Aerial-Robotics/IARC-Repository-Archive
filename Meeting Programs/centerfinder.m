function[x,y]=centerfinder(I)

[row,col]=size(I);
 
sumx=0;
sumy=0;
xi=0;
yi=0;

for aa=1:row
    
    for bb=1:col
        
        if I(aa,bb)==1
            sumx=sumx+aa;
            sumy=sumy+bb;
            xi=xi+1;
            yi=yi+1;
        end
    end
end
x=sumx/xi;
y=sumy/yi;
end