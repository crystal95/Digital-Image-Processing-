close all;
clear all;
%% Reading the image 
myimg=imread('octone.jpg');
figure();
imshow(myimg);
impixelinfo;
hsv = rgb2hsv(myimg);

%% Separating HSV components
h = hsv(:, :, 1); % Hue image.
s = hsv(:, :, 2); % Saturation image.
v = hsv(:, :, 3); % Value (intensity) image.

[ rows cols]= size(h);


for i=1:rows
    for j=1:cols
    if(h(i,j)<=0.111 || h(i,j)>=0.237 )
        h(i,j)=1;
        s(i,j)=1;
        v(i,j)=1;
    end
    end
  end
tmp = cat(3,h,s,v);
out=hsv2rgb(tmp);
%% displaying output
figure();
imshow(out);
impixelinfo;

