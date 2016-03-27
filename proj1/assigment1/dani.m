clear all;
image1=imread('spot2-diff1.png');
image2=imread('spot2-diff2.png');
idif=uint8(abs(double(image1)-double(image2)))-40;
idif=uint8(20*idif);
imshow(idif), hold on
himage=imshow(image1);
set(himage,'AlphaData',0.5);
