close all;
clc;clear all;

%% Scanning the images
img=imread('bottles.tif');
figure();imshow(img);

%% perfoming errosion
se=strel('disk',15);
img=imopen(img,se);
[rows cols] = size(img);

img = double(im2bw(img,0.764));
figure();imshow(img);

%% Performing the processing
dp=zeros(6,1);
max=0;
ind=1;
cnt=0;
prevflag=0;
for j=1:cols
    flag=0;
    cnt=0;
    for i=1:rows
        if(img(i,j)==1)
            cnt=cnt+1;
            flag=1;
            prevflag=0;
        end
    end
    
    if(flag==1) 
      if(cnt>dp(ind))
           dp(ind)=cnt;
      end
    else
        if(prevflag==0)
            ind=ind+1;
           prevflag=1;           
        end
    end
end
sz=size(dp);
for i=1:sz
    if(dp(i)>65)
     fprintf('The unfilled bottle is the bottle number %d from left \n',i);   
    end
end

        