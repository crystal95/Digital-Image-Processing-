close all; clear all; clc;
fprintf('Assignment-1, Ques-5(a), Bilateral Filtering Grayscale\n');

img =imread('face.png');
rows =size(img,1); cols =size(img,2);
figure, imshow(img);title('Original image');

N =2;
sigma_d =1;
sigma_r =30;

%Create Initial Gaussian Filter
[X,Y] = meshgrid(-N:N,-N:N);
G = exp(-(X.^2+Y.^2)/(2*sigma_d^2));

%Bilateral
for i=1:rows
    iMin = max(i-N,1);
    iMax = min(i+N,rows);
    for j=1:cols  
        jMin = max(j-N,1);
        jMax = min(j+N,cols);
        I = img(iMin:iMax,jMin:jMax);
        d = I - img(i,j);
        dfil = exp(double(-((d.^2)/2*sigma_r^2)));
    
        tmp = dfil.*G((iMin:iMax)-i+N+1,(jMin:jMax)-j+N+1);%% ask
        norm_tmp = sum(tmp(:));
        out(i,j) = sum(sum(uint8(tmp).*I))/uint8(norm_tmp);
    end
end
figure, imshow(uint8(out));title('Bilateral filtered image');
