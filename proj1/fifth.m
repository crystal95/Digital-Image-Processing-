image = imread('face.png');
[l,b] = size(image);
w = 5;
val = floor(w/2);
sigma = 20;
gaussian = zeros(w,w);

for i = 1:w
    for j = 1:w
        gaussian(i,j) = exp(-1*((i-val-1)^2+(j-val-1)^2)/2)/sqrt(2*pi);
    end
end
gaussian = gaussian/(min(min(gaussian)));
gaussian = gaussian/(sum(sum(gaussian)));
new = uint8(zeros(l,b));
for i = 1+val:l-val
    for j = 1+val:b-val;
        a = double(image(i-val:i+val,j-val:j+val));
        fil = [];
        for x1 = 1:w
            for x2 = 1:w
                fil(x1,x2) = exp(((a(x1,x2)-a(1+val,1+val))^2)/(-2*(sigma^2)))/(sqrt(2*pi)*sigma);
            end
        end
        fil = fil/(min(min(fil)));
        fil = fil/(sum(sum(fil)));
        a = a.*fil.*gaussian.*sigma;
        new(i,j) = sum(sum(a));
    end
end
figure,imshow(new);
        
