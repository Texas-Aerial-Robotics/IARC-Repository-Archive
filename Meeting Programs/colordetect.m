function [IR]=colordetect(I,r,g,b,tol)

Inum=double(I);
[row,col,n]=size(Inum);
IR=zeros(row,col);

for aa=1:row
    
    for bb=1:col
        
        for cc=1:n
            
            if cc==1
                if abs(Inum(aa,bb,cc)-r)<tol
                    IR(aa,bb)=IR(aa,bb)+1;
                end
            end
            if cc==2
                if abs(Inum(aa,bb,cc)-g)<tol
                    IR(aa,bb)=IR(aa,bb)+1;
                end
            end
            if cc==3
                if abs(Inum(aa,bb,cc)-b)<tol
                    IR(aa,bb)=IR(aa,bb)+1;
                end
            end
        end
        
        if IR(aa,bb)==3
            IR(aa,bb)=1;
        else
            IR(aa,bb)=0;
        end
    end
end
end
                
              