clear all;
close all;
image = imread('bell.jpg');
[l,b,h] = size(image);
imred = image(:,:,1);
imgreen = image(:,:,2);
imblue = image(:,:,3);
lambda = 20;
w = 3;
filter = ones(w,w);
filter = filter/(w*w);
val = floor(w/2);
newred = uint8(zeros(l,b));
newgreen = uint8(zeros(l,b));..................................
newblue = uint8(zeros(l,b));
for i = 1+val:l-val
    for j = 1+val:b-val
        ared = double(imred(i-val:i+val,j-val:j+val));
        ared = ared.*filter;
        newred(i,j)= sum(sum(ared)); %%%%%% this filtering acts like a low pass filtering as it tries to averagize ie deletes the edged so decrease high frequency components 
        agreen = double(imgreen(i-val:i+val,j-val:j+val));
        agreen = agreen.*filter;
        newgreen(i,j)= sum(sum(agreen));
        ablue = double(imblue(i-val:i+val,j-val:j+val));
        ablue = ablue.*filter;
        newblue(i,j)= sum(sum(ablue));
    end
end
new = cat(3,newred,newgreen,newblue);
figure,imshow(image+lambda*(image-new));	%%%%%%%%%image-low_passed image = high frequecied images it images with hhigh contrast edges and add it to original image !!!!!
