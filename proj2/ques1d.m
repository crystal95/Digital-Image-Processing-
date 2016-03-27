tic
close all
clear all
%% Scanning Original image and Template
myimg1 = imread('vegan-modified.jpg');
mytmp1 = imread('soy-dessert.jpg');
qwert=myimg1;
f=10;
myimg = imresize(myimg1,1/f);
mytmp = imresize(mytmp1,1/f);

[rows1, cols1] = size(myimg);
[rows2, cols2] = size(mytmp);
N=rows2*cols2;

mytmp = double(mytmp);
avgmytmp=mean2(mytmp);
avgmytmpmat=mytmp-avgmytmp;

%% Getting template sum
myimgint=integralImage(myimg);
mytmpint=integralImage(mytmp);

x=0;
for i=1:rows1-rows2
    for j=1:cols1-cols2
         tmp=myimg(i:i+rows2-1, j:j+cols2-1);
        
            tmp = double(tmp);
            avgtmp = myimgint(i+rows2-1,j+cols2-1)+myimgint(i,j)-myimgint(i+rows2-1,j)-myimgint(i,j+cols2-1);   
           avgtmp=avgtmp/N;
            % avgtmp=double(mean2(tmp));
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

%% Displaying Final results
final;
figure();
imshow(myimg);
rectangle('Position',[final(2) final(1) cols2 rows2],'EdgeColor','g');

toc