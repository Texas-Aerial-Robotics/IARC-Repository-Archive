%the purpose of this user defined function is to calculate the optical flow
%   between 2 images 
%   the inputs for this function are 2 grayscale frames
%   the outputs for the function are the flow in the x direction (u) and y
%   direction (v)
%   last modified by Eric Johnson on 8/31/16

function [u, v] = lucasKanade(im1, im2)
%LucasKanade  lucas kanade algorithm, without pyramids (only 1 level);

[fx, fy, ft] = ComputeDerivatives(im1, im2);
u = zeros(size(im1));
v = zeros(size(im2));

[height, width] = size(im1);
for row=2:height-1
   for col=2:width-1
      %fill least square matrix A
      curFx = fx(row-1:row+1, col-1:col+1);
      curFy = fy(row-1:row+1, col-1:col+1);
      curFt = ft(row-1:row+1, col-1:col+1);
      
      curFx = curFx';
      curFy = curFy';
      curFt = curFt';


      curFx = curFx(:);
      curFy = curFy(:);
      curFt = -curFt(:);
      
      A = [curFx,curFy];
      
      U = pinv(A'*A)*A'*curFt;
      
      u(row,col)=U(1);
      v(row,col)=U(2);
      
   end
end

u(isnan(u))=0;
v(isnan(v))=0;


