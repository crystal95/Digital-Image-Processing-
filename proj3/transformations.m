myimg=imread('circles.jpg');
figure();
imshow(myimg);
impixelinfo;

[rows , cols ] = size(myimg);

for i=1:rows
    for j=1:cols
        if(i~=j)
        ans(i*i-j*j,2*i*j)=myimg(i,j);
        end
    end
end

figure();
imshow(ans);