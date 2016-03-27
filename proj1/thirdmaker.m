image = imread('chip.jpg');
figure;
imshow(image);
first = image;
[l, b] = size(image);
himage = imhist(image);
himage = himage/(l*b);
cimage = [];
cimage(1) = himage(1);
for i = 2:256
    cimage(i) = cimage(i-1) + himage(i);
end
timage = cimage*255;

for i = 1:l
    for j = 1:b
        image(i,j) = timage(image(i,j)+1);
    end
end
image1 = adapthisteq(image);
image2 = imsharpen(image1);
figure
imshow(image);
figure
imshow(image1);
figure
imshow(image2);
second = image;