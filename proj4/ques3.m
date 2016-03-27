%% Scan the image
I = imread('1.jpg');
%% add the noise
J = imnoise(I,'gaussian',0,0.001);
%[cA,cH,cV,cD] = dwt2(J,'haar');
figure, imshow(uint8(J));
%% process the image
wname = 'coif2'; 
[cA,cH,cV,cD] = dwt2(J, wname);

maxH = max(cH(:));
maxV = max(cV(:));
maxD = max(cD(:));
mx = [maxH maxV maxD];
th = max(mx)/20;

cH(find(~(cH<th & cH>-th))) = 0;
cV(find(~(cV<th & cV>-th))) = 0;
cD(find(~(cD<th & cD>-th))) = 0;

X = idwt2(cA,cH,cV,cD,wname);
figure, imshow(uint8(X));