close all;
clear all;

%% scaning the images  
orig=imread('son3.gif');
orig=double(orig);
figure();
imshow(orig);
orig=orig*255;
title('son3');

[tmp1,map]=imread('son3rot1.gif');
imwrite(tmp1,map,'rot1.jpg');
temp1=imread('rot1.jpg');
figure();
imshow(temp1);
title('son3rot1');

[tmp2,map]=imread('son3rot2.gif');
imwrite(tmp2,map,'rot2.jpg');
temp2=imread('rot2.jpg');
figure();
imshow(temp2);
title('son3rot2');

[tmp3,map]=imread('son3rot3.gif');
imwrite(tmp3,map,'rot3.jpg');
temp3=imread('rot3.jpg');
figure();
imshow(temp3);
title('son3rot3');

%% finding size of images
sizeorig=(size(orig));
sizetemp1=(size(temp1));
sizetemp2=(size(temp2));
sizetemp3=(size(temp3));

%% processing images
for i=0:360
    B1=imrotate(temp1,i,'bilinear','crop');
    B1=double(rgb2gray(B1));
    B2=imrotate(temp2,i,'bilinear','crop');
    B2=double(rgb2gray(B2));
    B3=imrotate(temp3,i,'bilinear','crop');
    B3=double(rgb2gray(B3));
    diff1=abs(B1-orig);
    diffsum1=sum(sum(diff1));
    diff2=abs(B2-orig);
    diffsum2=sum(sum(diff2));
    diff3=abs(B3-orig);
    diffsum3=sum(sum(diff3));
    
    if(i==0)
        final=i;
        minm1=diffsum1;
        minm2=diffsum2;
        minm3=diffsum3;
    else
        if(diffsum1<minm1)
            minm1=diffsum1;
            final1=i;
        end
        if(diffsum2<minm2)
            minm2=diffsum2;
            final2=i;
        end
        if(diffsum3<minm3)
            minm3=diffsum3;
            final3=i;
        end
        
    end
end
fprintf('angle of rotation of  son3rot1.gif of %0.2f anticlockwise is needed to get original image \n',final1);
fprintf('angle of rotation of  son3rot2.gif of %0.2f anticlockwise is needed to get original image \n',final2);
fprintf('angle of rotation of  son3rot3.gif of %0.2f anticlockwise is needed to get original image \n',final3);

 

