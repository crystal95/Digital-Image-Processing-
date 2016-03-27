%% Question 4(A) : Cylindrical Projection

clc;
close all;

im = double(imread('map.gif'));

%imshow(im);
s = size(im);
b = s(1)/2;
l = s(2)/2;

% Setting the domain for different row and column (as Sin function to be mapped, hence -pi/2 to pi/2)
dom_l_min =-1;
dom_l_max = 1;
dom_b_min = -pi/10;
dom_b_max = pi/10;

step1 = (dom_l_max - dom_l_min)/l/2;
step2 = (dom_b_max - dom_b_min)/b/2;

[x_or y_or] = meshgrid(dom_l_min:step1:dom_l_max-step1,dom_b_min:step2:dom_b_max-step2);

% Setting the range for different row and column
ran_l_min = -1;
ran_l_max = 1;
ran_b_min = -1;
ran_b_max = 1;

step_1 = (ran_l_max - ran_l_min)/l/2;
step_2 = (ran_b_max - ran_b_min)/b/2;

[x_ne y_ne] = meshgrid(ran_l_min:step_1:ran_l_max-step_1,ran_b_min:step_2:ran_b_max-step_2);

x_old = x_ne;
y_old = asin(y_ne);
 imagesc(interp2(x_or,y_or,im',x_old,x__old)')
%im1 = transpose(im);

imshow(imnew);

