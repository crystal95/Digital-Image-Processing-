clear;
clc;
close all;

im1 = imread(('./test-images-for-q2/son3.gif'));
im2 = imread(('./test-images-for-q2/son3rot2.gif'));




 ab = abs (double(im1)-double(im2));
min = sum(ab(:));
for i = 0:360
      i  
    Y = imrotate(im1,i,'bilinear','crop');
    ad = abs(double(im2)-double(Y));
    sum2 = sum(ad(:));
    sum2
    if (sum2<min)
        min = sum2;
        y=i;
        y
    end
end
y
figure();
imshow(im2);
