clear all;
clc;
A = imread('spot2-diff1.png');
B = imread('spot2-diff2.png');
C1 = A-B;
C = rgb2gray(C1);
[x,y] = size(C);
[M,N] = find(C>10);
z = size(M);
D = zeros(z(1),1);
imshow(A);
hold on;

for i = 1 : z(1)
    if D(i,1) == 0
        rectangle('Position',[N(i) M(i) x/15 y/15 ],'EdgeColor','r');
        D(i,1) = 1;
        for j = i+1:z(1)
            if abs(M(i)-M(j)) < (y/15)
                if abs(N(i)-N(j)) < (x/15)
                    D(j) = 1;
                end
            end
        end
    end
end
                
hold off;