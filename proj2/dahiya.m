tic
close all; clear all; clc;

resizeFactor=2;
img=imread('vegan.jpg'); original=img;
img=imresize(img,1/resizeFactor);   %resizing to make process faster
temp=imread('soy-dessert.jpg'); otemp=temp;
temp=imresize(temp,1/resizeFactor);
[row, col]=size(img);
[tr, tc]=size(temp);

minimum=10000;
for i=1:row-tr
    for j=1:col-tc
        win=img(i:i+tr-1,j:j+tc-1); %image part of size of template
        %diff=imabsdiff(temp,win); It is slower than below line of code
        diff=abs(temp-win) + abs(win-temp);
        avg=sum(diff(:))/(tr*tc);  %sum of absolute difference
        % average of sum will be minimum where there is maximum similarity
        % because abs diff will be minimum there
        if avg<minimum
            minimum=avg;
            % store the position of maximum similarity
            x=resizeFactor*i;y=resizeFactor*j;
        end
    end
end

imshow(original);
rectangle('Position',[y x resizeFactor*tc resizeFactor*tr],...
    'EdgeColor','r','LineWidth',3);
figure,imshow(otemp);
toc