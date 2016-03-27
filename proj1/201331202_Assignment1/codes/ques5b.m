close all; clear all; clc;
fprintf('Assignment-1, Ques-5(a), Bilateral Filtering RGB\n');

img = imread('boy_smiling.jpg');
rows =size(img,1); cols =size(img,2);
figure, imshow(img);
img = double(img);title('Original image');

N =3;
sigma_d =2;
sigma_r =30;

%Pre-compute the first gaussian from the formula
[X,Y] = meshgrid(-N:N,-N:N);
G = exp(-(X.^2+Y.^2)/(2*sigma_d^2));

%Bilateral filter
for i = 1:rows
         % 
         iMin = max(i-N,1);
         iMax = min(i+N,rows);
   for j = 1:cols
         jMin = max(j-N,1);
         jMax = min(j+N,cols);
         
         I = img(iMin:iMax,jMin:jMax,:);
         dr = I(:,:,1)-img(i,j,1);
         dg = I(:,:,2)-img(i,j,2);
         db = I(:,:,3)-img(i,j,3);
         H = exp(double(-(dr.^2+dg.^2+db.^2)/(2*sigma_r^2)));
         % Calculate bilateral filter response.
         tmp = H.*G((iMin:iMax)-i+N+1,(jMin:jMax)-j+N+1);
         norm_tmp = sum(tmp(:));
         Out(i,j,1) = sum(sum((tmp).*I(:,:,1)))/norm_tmp;
         Out(i,j,2) = sum(sum((tmp).*I(:,:,2)))/norm_tmp;
         Out(i,j,3) = sum(sum((tmp).*I(:,:,3)))/norm_tmp;
                
   end
end
figure, imshow(Out/255);title('Bilateral filtered image');