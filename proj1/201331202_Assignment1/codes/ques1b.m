close all;
a=imread('spot2-diff1.png');
b=imread('spot2-diff2.png');
c=imabsdiff(a,b);



[rows,cols,dim]=size(c);

tmp=rgb2gray(c);figure();
imshow(tmp);

figure();
imshow(a);

[rows,cols]=size(tmp);
hold on;
impixelinfo
for i=1:rows
    for j=1:cols
          if(tmp(i,j)>20)
              rectangle('Position',[j i rows/10 cols/10 ],'EdgeColor','g');
                 for k=i-rows/10:i+rows/10
                 for l=j-cols/10:j+cols/10
                    if(k>0 && k<=rows && l>0 && l<=cols) 
                     tmp(k,l)=5;
                                      
                 end
                 end
                 
                 end
               
          end
         
    end
end


hold off;