tic 
close all
clear 
%% Scaning the original image and template image
myimg1 = imread('vegan-modified.jpg');
mytmp1 = imread('soy-dessert.jpg');
qwert=myimg1;
f=10;
myimg = imresize(myimg1,1/f);
mytmp = imresize(mytmp1,1/f);

%% Getting rows and columns
[rows1, cols1] = size(myimg);
[rows2, cols2] = size(mytmp);
N=rows2*cols2;

mytmp = double(mytmp);
avgmytmp=mean2(mytmp);
avgmytmpmat=mytmp-avgmytmp;

%% Processing original image 
x=0;
for i=1:rows1-rows2
    for j=1:cols1-cols2
         tmp=myimg(i:i+rows2-1, j:j+cols2-1);
        
            tmp = double(tmp);
            avgtmp=double(mean2(tmp));
            avgtmpmat=tmp-avgtmp;
        
            ans=avgtmpmat.*avgmytmpmat;
        
            anssum=ans/N;
            stdtmp=std(tmp(:));
            stdmytmp=std(mytmp(:));
            
            anssum=anssum/(stdtmp*stdmytmp);

        
              if(sum(sum(anssum))>x)
               x =sum(sum(anssum));
               final=[i,j];
             end
    end
end

%% Displaying results
final;
figure();
imshow(qwert);
rectangle('Position',[final(2)*f final(1)*f  cols2*f rows2*f],'EdgeColor','g');

toc