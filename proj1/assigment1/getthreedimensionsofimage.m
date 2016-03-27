close all;
clear all;
img = imread('bell.jpg'); % Read image
red = img(:,:,1); % Red channel
figure, imshow(red), title('Original image');
figure;
sz2=size(red);
sz2
green = img(:,:,2); % Green channel
sz3=size(green);
sz3
blue = img(:,:,3); % Blue channel
imhist(red);
hred = imhist(red);
sz2=size(hred);
sz=size(img);
a = zeros(sz(1), sz(2));
just_red = cat(3, red, a, a);
just_green = cat(3, a, green, a);
just_blue = cat(3, a, a, blue);
back_to_original_img = cat(3, red, green, blue);
%figure, imshow(img), title('Original image')
%figure, imshow(just_red), title('Red channel')
%figure, imshow(just_green), title('Green channel')
%figure, imshow(just_blue), title('Blue channel')
%figure, imshow(back_to_original_img), title('Back to original image')
