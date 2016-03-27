close all;
image = imread('office.jpg');
figure;
imshow(image);
first = image;
[l, b,h] = size(image);
red = image(:,:,1);
green = image(:,:,2);
blue = image(:,:,3);
hred = imhist(red);
figure;
imhist(red);
hgreen = imhist(green);
hblue = imhist(blue);
hred = hred/(l*b);
hgreen = hgreen/(l*b);
hblue = hblue/(l*b);
cred = [];
cred(1) = hred(1);
cgreen = [];
cgreen(1) = hgreen(1);
cblue = [];
cblue(1) = hblue(1);
for i = 2:256
    cred(i) = cred(i-1) + hred(i);
    cgreen(i) = cgreen(i-1) + hgreen(i);
    cblue(i) = cblue(i-1) + hblue(i);
end
tred = cred*255;
tgreen = cgreen*255;
tblue = cblue*255;
for i = 1:l
    for j = 1:b
        red(i,j) = tred(red(i,j)+1);
        green(i,j) = tgreen(green(i,j)+1);
        blue(i,j) = tblue(blue(i,j)+1);
    end
end
figure;
imhist(red)
image = cat(3,red,green,blue);
figure
imshow(image);
second = image;





      
