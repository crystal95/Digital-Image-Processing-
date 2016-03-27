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
lap = [0 -1 0;-1 4 -1;0 -1 0];
[size_x,size_y]= size(image);
new = uint8(zeros(l,b));
for i = 2:size_x-1
    for j = 2:size_y-1
        a = double(image(i-1:i+1,j-1:j+1));
        a = a.*lap;
        new(i,j)= sum(sum(a));
    end
end
figure,imshow(new+first);
        
        

