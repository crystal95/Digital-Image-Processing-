close all;
image = imread('office.jpg');
[l, b,h] = size(image);

red = image(:,:,1);
figure;
imhist(red);
green = image(:,:,2);
blue = image(:,:,3);
hred = imhist(red);
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

ramp=[];
for i = 1:256
    if(i<=100)
        ramp(i) = 0;
    elseif i<151
        ramp(i) = ramp(i-1)+((l*b)/255)*(i-100)/50;
    else
        ramp(i) = ramp(i-1);
    end
end
ramp = ramp/(l*b);
cramp = [];
cramp(1) = ramp(1);
for i = 2:256
    cramp(i) = cramp(i-1)+ramp(i);
end

mapcred = zeros(256,1);
mapcgreen = zeros(256,1);
mapcblue = zeros(256,1);
for i = 1:256
    [~,index] = min(abs(cramp-cred(i)));
    mapcred(i) = index(1);
    [~,index] = min(abs(cramp-cgreen(i)));
    mapcgreen(i) = index(1);
    [~,index] = min(abs(cramp-cblue(i)));
    mapcblue(i) = index(1);
end

for i = 1:l
    for j = 1:b
        red(i,j) = mapcred(red(i,j)+1);
        green(i,j) = mapcgreen(green(i,j)+1);
        blue(i,j) = mapcblue(blue(i,j)+1);
    end
end
figure;
imhist(red);
image = cat(3,red,green,blue);
figure
imshow(image);