close all;
a=imread('spot2-diff1.png');
b=imread('spot2-diff2.png');

c=imabsdiff(a,b);
figure();
imshow(c);
[rows,cols,dim]=size(c);
rows
cols

figure();
imshow(a);
hold on;
for i=1:rows
    for j=1:cols
        if(c(i,j,1)>10 || c(i,j,2)>10 || c(i,j,3)>10)
             rectangle('Position',[j i rows/10 cols/10 ],'EdgeColor','r');
             for k=i:i+rows/10
                 for l=j;j+cols/10
                     c(k,l,1)=0;
                     c(k,l,2)=0;
                     c(k,l,3)=0;
                 end
             end
           end
    end
end


hold off;



