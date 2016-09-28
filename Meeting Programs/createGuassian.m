%the purpose of this user defined function is to generate a guassian mask
%   the inputs for this function is the dimenstion ***MUST BE AN ODD
%   INTEGER***
%   the outputs for tis function is the guassian mask
%   created 9/21/16
function guassMask = createGuassian(dimension)

%create zeros matrix size of mask
guassMask = zeros(dimension);
%define sigma 
sigma=(dimension-1)/3;

%apply guassian function using mask positions as points
%   NOTE: we want the mask to be symetric so we shift the origin to the
%   center of the matrix
for row=1:dimension
    for col=1:dimension
        %shift origin 
        x=col-((dimension+1)/2);
        y=row-((dimension+1)/2);
        
        %apply guassian function 
        guassMask(row,col)=(1/sqrt(2*pi*sigma))*exp(-(x^2+y^2)/(2*sigma^2));
        
    end
end
        

