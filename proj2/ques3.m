tic
clc;
close all;
clear all;

%% scaning images
myimg=imread('rupee-symbol.jpg');
myimg=rgb2gray(myimg);
myimg=double(myimg);

figure();
imshow(myimg/255);
title('original image');

[rows cols]=size(myimg);

F1 = fftshift(fft2(myimg/255));
figure();
imshow(log(abs(F1)));
title('original spectrum');

%% Scaling the function: x[m, n] → ax[m, n]
a = 6 ;
F2=fftshift(fft2(a*myimg));

figure();
imshow((a*myimg)/255);

figure();
imshow(log(abs(F2))); 

%% Scaling the argument: [m, n] → [am, an]
a=2;
temp2=double(zeros(a*rows,a*cols));
for i=1:rows
    for j=1:cols
        temp2(a*i, a*j) = myimg(i,j);
    end
end
figure();
imshow(temp2/255);

 F1 = fftshift(fft2(temp2/255));
 figure();
 imshow(log(abs(F1)));


%%  Shifting the argument: [m, n] → [m + m0 , n + n0 ] % % %
mo=200;
no=200;
X=double(zeros(rows,cols));
tmp=myimg(mo:rows,no:cols);

X(mo:rows,no:cols)=tmp;

figure();
imshow(X/255);

F2=fftshift(fft2(X/255));
figure();
imshow(abs(F2));


%% Reflection about a vertical line(n=N/2: N is the width of theimage): x[m, n] → x[m, N − n] % % %

tmp4=flipdim(myimg,2);

figure();
imshow(tmp4/255);
F2=fftshift(fft2(tmp4/255));
figure();
imshow(log(abs(F2)));


toc
