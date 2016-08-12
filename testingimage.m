%image reading test
rGB=imread('University-of-Texas-Football.jpg');
g=rgb2gray(rGB);
imshow(g)

I=LoG_filter(g,7);
figure(2)
imshow(I)