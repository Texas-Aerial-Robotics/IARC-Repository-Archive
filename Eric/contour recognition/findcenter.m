function[point]=findcenter(BI)
%finds center of a binary image
point=[0,0];
[row,col]=size(BI);
sumx=0;
sumy=0;
sum=0;
for aa=1:row
    for bb=1:col
        
        if BI(aa,bb)==1
            sumx=sumx+aa;
            sumy=sumy+bb;
            sum=1+sum;
            
        end
    end
    
end
 point(1)=sumx/sum;
 point(2)=sumy/sum;
 