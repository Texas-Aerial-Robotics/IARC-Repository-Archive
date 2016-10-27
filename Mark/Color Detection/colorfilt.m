function [I]=colorfilt(IM1,r,g,b,range)
%convert image to double precision
Imatrix=double(IM1);
%get size of matrix
[row,col]=size(Imatrix(:,:,1));
IMR=zeros(row,col,3);
I=zeros(row,col);

%filter

 for aa=1:row
    
     for bb=1:col
        for layer=1:3
           
            if layer == 1
               
               if abs((Imatrix(aa,bb,layer)-r))<=range
                   IMR(aa,bb,layer)=1;
               end
            end
           
           if layer == 2
               
               if abs((Imatrix(aa,bb,layer)-g))<=range
                   IMR(aa,bb,layer)=1;
               end
           end
          
           if layer == 3
               
               if abs((Imatrix(aa,bb,layer)-b))<=range
                   IMR(aa,bb,layer)=1;
               end
           end   
        end
               if IMR(aa,bb,1)== 1 && IMR(aa,bb,2)== 1 && IMR(aa,bb,3)==1
                    I(aa,bb)=1;
               end
    end
 end


