image = imread('office.jpg');
[l, b,h] = size(image);
red = image(:,:,1);
green = image(:,:,2);
blue = image(:,:,3);
figure;
imhist(red);
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
% tred = cred*255;
% tgreen = cgreen*255;
% tblue = cblue*255;
% for i = 1:l
%     for j = 1:b
%         red(i,j) = tred(red(i,j)+1);
%         green(i,j) = tgreen(green(i,j)+1);
%         blue(i,j) = tblue(blue(i,j)+1);
%     end
% end
% image = cat(3,red,green,blue);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%histogram matching

step=[];
for i = 1:256
    if(i<=100)
        step(i) = 0;
    else
        step(i) = (l*b)/156;
    end
end
step = step/(l*b);
cstep = [];
cstep(1) = step(1);
for i = 2:256
    cstep(i) = cstep(i-1)+step(i);
end
%cstep = cstep*255;
mapcred = zeros(256,1);
mapcgreen = zeros(256,1);
mapcblue = zeros(256,1);
for i = 1:256
    [~,index] = min(abs(cstep-cred(i)));
    mapcred(i) = index(1);
    [~,index] = min(abs(cstep-cgreen(i)));
    mapcgreen(i) = index(1);
    [~,index] = min(abs(cstep-cblue(i)));
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