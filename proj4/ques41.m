% clc;swxdc 

close all;
clear all;
im = (imread('1.jpg'));
figure,imshow(im), title('orignal image');
im = rgb2gray(im);
[rows,cols] = size(im);
Inew = zeros(size(im));

for i = 1:rows
    for j = 1:cols
        x0 = floor((i) + (5 * sin((2*pi*j)/50)));
        y0 = floor((j) + (5 * sin((2*pi*i)/50)));
        if (x0 >= 1 && x0<rows && y0 >= 1 && y0<cols)
            Inew(i,j) = im(x0,y0);
        else
            x0
        end 
        
    end
end

figure,imshow(im,[]), title('greyscale image');
figure,imshow(Inew,[]) , title('ripple image');
        
