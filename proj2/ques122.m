close all
clear all
myimg1 = imread('vegan-modified.jpg');
mytmp1 = imread('soy-dessert.jpg');
myimg = imresize(myimg1,0.2);
mytmp = imresize(mytmp1,0.2);

[rows1, cols1] = size(myimg);
[rows2, cols2] = size(mytmp);
N=rows2*cols2;

for i=1:rows1-rows2
    for j=1:cols1-cols2
       tmp=myimg(i:i+rows2-1, j:j+cols2-1);
       y=tmp.*mytmp;
       tmp1=tmp.*tmp;
       tmp2=mytmp.*mytmp;
       a1=sum(sum(tmp1));
       a2=sum(sum(tmp2));
       a3=sqrt(a1)*sqrt(a2);
         
       anssum=sum(sum(y))/a3; 
           
       if(i==1 && j==1)
            x = anssum;
            final=[i,j];
 
        else
              if(x > anssum)
               x =anssum;
               final=[i,j];
             end
        end
    end
end

final;
figure();
imshow(myimg);
rectangle('Position',[final(2) final(1)  cols2 rows2] , 'EdgeColor','g');
figure();
imshow(mytmp);
