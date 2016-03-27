image = imread('boy_smiling.jpg');
[l,b,h] = size(image);
imred = image(:,:,1);
imgreen = image(:,:,2);
imblue = image(:,:,3);
w = 5;
val = floor(w/2);
sigma = 30;
gaussian = zeros(w,w);
for i = 1:w
    for j = 1:w
        gaussian(i,j) = exp(-1*((i-val-1)^2+(j-val-1)^2)/2)/sqrt(2*pi);
    end
end
gaussian = gaussian/(min(min(gaussian)));
gaussian = gaussian/(sum(sum(gaussian)));
newred = uint8(zeros(l,b));
newgreen = uint8(zeros(l,b));
newblue = uint8(zeros(l,b));
for i = 1+val:l-val
    for j = 1+val:b-val;
        ared = double(imred(i-val:i+val,j-val:j+val));
        agreen = double(imgreen(i-val:i+val,j-val:j+val));
        ablue = double(imblue(i-val:i+val,j-val:j+val));
        filred = [];
        filgreen = [];
        filblue = [];
        for x1 = 1:w
            for x2 = 1:w
                filred(x1,x2) = exp(((ared(x1,x2)-ared(1+val,1+val))^2)/(-2*(sigma^2)))/(sqrt(2*pi)*sigma);
                filgreen(x1,x2) = exp(((agreen(x1,x2)-agreen(1+val,1+val))^2)/(-2*(sigma^2)))/(sqrt(2*pi)*sigma);
                filblue(x1,x2) = exp(((ablue(x1,x2)-ablue(1+val,1+val))^2)/(-2*(sigma^2)))/(sqrt(2*pi)*sigma);
            end
        end
        filred = filred/(min(min(filred)));
        filred = filred/(sum(sum(filred)));
        filgreen = filgreen/(min(min(filgreen)));
        filgreen = filgreen/(sum(sum(filgreen)));
        filblue = filblue/(min(min(filblue)));
        filblue = filblue/(sum(sum(filblue)));
        ared = ared.*filred.*gaussian.*sigma;
        agreen = agreen.*filred.*gaussian.*sigma;
        ablue = ablue.*filred.*gaussian.*sigma;
        newred(i,j) = sum(sum(ared));
        newgreen(i,j) = sum(sum(agreen));
        newblue(i,j) = sum(sum(ablue));
    end
end
new = cat(3,newred,newgreen,newblue);
figure,imshow(new);