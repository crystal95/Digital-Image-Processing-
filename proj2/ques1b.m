tic
close all
clear all

%% Scaning the original image and template image
myimg1 = imread('vegan-modified.jpg');
mytmp1 = imread('soy-dessert.jpg');
myimg = imresize(myimg1,0.5);
mytmp = imresize(mytmp1,0.5);
 
 %% finding the row and columns of input images
 [rows1, cols1] = size(myimg);
 [rows2, cols2] = size(mytmp);

 %% traversing all possible sub-templates and using the sub-template with minimum abs difference sum  
 for i=1:rows1-rows2
    for j=1:cols1-cols2
        tmp=myimg(i:i+rows2-1, j:j+cols2-1);
        tmp2=abs(tmp-mytmp)+abs(mytmp-tmp);
        tmpsum=sum(sum(tmp2));
      
        if(i==1 && j==1)
            x = tmpsum;
             final=[i,j];
 
        else
              if(x > tmpsum)
               x =tmpsum;
               final=[i,j];
             end
        end
    end
end

final;
%% marking the rectangle on closest matched template
figure();
imshow(myimg);
rectangle('Position',[final(2) final(1)  cols2 rows2],'EdgeColor','g');
figure();
imshow(mytmp);
toc