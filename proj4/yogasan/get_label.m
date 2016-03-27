function [label] = get_label(img,l)

if(l==1)
figure();imshow(img);
end;
b=edge(img,'canny');
%figure();imshow(b);

[rows cols] = size(b);


%% Getting Start pixel
for i=1:rows
    for j=1:cols
        if(b(i,j)==1)
            row=i;
            col=j;
            break;
        end
    end
end



%% Taking only boundary pixels
boundary = bwtraceboundary(b,[row,col],'W',8);


%% Displaying only outer edges

X=double(zeros(rows,cols));
[rows1 cols1] = size(boundary);

for i=1:rows1
   X(boundary(i,1),boundary(i,2))=1;
end
X1=imresize(X,0.5);
if(l==1)
figure ;imshow(X1);
end

%% Assigning Label to Boundary
label=zeros(rows,1);
 for i=2:rows1
     if(boundary(i,1)==boundary(i-1,1) && boundary(i,2)==boundary(i-1,2)+1) 
         label(i)=0;
     elseif(boundary(i,1)==boundary(i-1) && boundary(i,2)==boundary(i-1,2)-1)
         label(i)=4;
     elseif(boundary(i,1)==boundary(i-1)-1 && boundary(i,2)==boundary(i-1,2))
         label(i)=2;
     elseif(boundary(i,1)==boundary(i-1)+1 && boundary(i,2)==boundary(i-1,2))
         label(i)=6;
         
     elseif(boundary(i,1)==boundary(i-1)-1 && boundary(i,2)==boundary(i-1,2)+1) 
          label(i)=1;
     elseif(boundary(i,1)==boundary(i-1)-1 && boundary(i,2)==boundary(i-1,2)-1)
         label(i)=3;
     elseif(boundary(i,1)==boundary(i-1)+1 && boundary(i,2)==boundary(i-1,2)+1)    
        label(i)=7; 
     elseif(boundary(i,1)==boundary(i-1)+1 && boundary(i,2)==boundary(i-1,2)-1)   
         label(i)=5;
     end
 end