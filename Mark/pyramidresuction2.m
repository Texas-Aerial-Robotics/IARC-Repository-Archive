%image reduction test
OG=imread('University-of-Texas-Football.jpg');
figure(1)
imshow(OG)

gauss=createGuassMask(7,1);
grayI=rgb2gray(OG);

[row,col]=size(grayI);
figure(2)
imshow(grayI)

newI=zeros((row+1)/2,col/2);

for r=1:row
    
    for c=1:col
        
        
        if 2*r+3>row || 2*c+3>col
            break
        elseif r-3<1 || r+3>row || c-3<1 || c+3>col
            newI(r,c)=0;

        else
            
            temp=double(grayI(2*r-3:2*r+3,2*c-3:2*c+3));
            swag=temp.*gauss;
            newrow=sum(swag);
            newpixel=sum(newrow);
            newpixel=round(newpixel);
            
            newI(r,c)=newpixel;
        end
    end
    
            
end
        newI2=mat2gray(newI);
        figure(4)
        imshow(newI2)