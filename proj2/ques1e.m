tic
close all
clear all
%% Scanning Original Image and Template
myimg1 = imread('vegan-modified.jpg');
mytmp1 = imread('soy-dessert.jpg');
 myimg = imresize(myimg1,0.5);
 mytmp = imresize(mytmp1,0.5);
 [rows1, cols1] = size(myimg);
 [rows2, cols2] = size(mytmp);
 
 %% Getting Normal Correlation function using inbuilt matlab commands
 cc=normxcorr2(mytmp,myimg);
 
 [max_cc , imax] =max(abs(cc(:)));
 [ypeak , xpeak] = ind2sub(size(cc),imax(1));
 bestrow = ypeak-(rows2-1);
 bestcol= xpeak-(cols2-1);
 
 %% Displaying Final results
figure();
imshow(myimg);
rectangle('Position',[ bestcol bestrow cols2-1 rows2-1],'EdgeColor','g');
figure();
imshow(mytmp);
toc