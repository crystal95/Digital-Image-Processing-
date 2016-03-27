clc;
close all;
clear all;
%% Scanning the image 
im = (imread('1.jpg'));
figure,imshow(im,[]), title('orignal image');
im = rgb2gray(im);

%% Getting size of the image
[rows cols] = size(im);

%% Getting the meshgrid
[x_or,y_or] = meshgrid(1:rows, 1:cols);
x_old = (x_or + 10*sin(((2*pi)/50)*y_or));
y_old =((y_or + 20*sin(((2*pi)/30)*y_or)));

im = im2double(im);

%% Performing interpolation
imnew = interp2(x_or,y_or,im,x_old,y_old);

%% Displaing the image 
figure();
imshow(imnew);