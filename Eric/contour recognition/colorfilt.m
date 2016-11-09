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
        rPer = abs((Imatrix(aa,bb,1))-r)/r;
        gPer = abs((Imatrix(aa,bb,2))-g)/g;
        bPer = abs((Imatrix(aa,bb,3))-b)/b;
        
        perError = (1/3)*(rPer + gPer + bPer);
        if perError < .13
            I(aa,bb)=1;
        end
        
    end
end



%         rPer = abs(r-(Imatrix(aa,bb,1)))/r;
%         gPer = abs(g-(Imatrix(aa,bb,2)))/g;
%         bPer = abs(b-(Imatrix(aa,bb,3)))/b;
%         
%         perError = (1/3)*(rPer + gPer + bPer);
%         if perError < .3
%             I(aa,bb)=1;
%         end



 
 
 %         for layer=1:3
%            
%             if layer == 1
%                
%                if abs((Imatrix(aa,bb,layer)-r)) <=range
%                    IMR(aa,bb,layer)=1;
%                end
%             end
%            
%            if layer == 2
%                
%                if abs((Imatrix(aa,bb,layer)-g))/g <= range
%                    IMR(aa,bb,layer)=1;
%                end
%            end
%           
%            if layer == 3
%                
%                if abs((Imatrix(aa,bb,layer)-b))/b <= range
%                    IMR(aa,bb,layer)=1;
%                end
%            end   
%         end
%                if IMR(aa,bb,1)== 1 && IMR(aa,bb,2)== 1 && IMR(aa,bb,3)==1
%                     I(aa,bb)=1;
%                end
