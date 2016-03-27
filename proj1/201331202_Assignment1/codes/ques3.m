clear;
clc;
close all;

im = imread('chip.jpg');
[h w] = size(im);
imn = zeros(h,w);

c1 = 500;

for i = 1:h
    for j = 1:w
%         imn(i,j) = (im(i,j) / 50)*255;
         imn(i,j) = c1 * log(double(1+ im(i,j)));
%          imn(i,j) = im(i,j) + mean2(im);
    end
end

% imn = imadjust(im);

figure, imshow(im);
figure, imshow(uint8(imn));

% c2 = 1;
% imsh = padarray(imn,[1 1]);
% for i = 2:(h+1)
%     for j = 2:(w+1)
%         k = (imsh(i+1,j) - 4*imsh(i,j) + imsh(i-1,j) + imsh(i,j+1) + imsh(i,j-1)) ; 
%         final(i-1,j-1) = imsh(i,j) + c2 * k;
%     end
% end
% 
% figure, imshow(final,[]);

%Preallocate the matrices with zeros
I1=imn;
I=zeros(size(imn));
I2=zeros(size(imn));

%Filter Masks
F1=[0 1 0;1 -4 1; 0 1 0];
F2=[1 1 1;1 -8 1; 1 1 1];

%Padarray with zeros
imn=padarray(imn,[1,1]);
imn=double(imn);

%Implementation of the equation in Fig.D
for i=1:size(imn,1)-2
    for j=1:size(imn,2)-2
       
        I(i,j)=sum(sum(F2.*imn(i:i+2,j:j+2)));
       
    end
end

I=uint8(I);
figure,imshow(I);

%Sharpenend Image
%Refer Equation in Fig.F
B=uint8(I1) - I;
figure,imshow(B);

filt = fspecial('laplacian');
temp = conv2(imn,filt,'same');
figure, imshow(temp);
        
        
        
        