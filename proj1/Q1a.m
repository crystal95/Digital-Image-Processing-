A = imread('spot1-diff1.jpg');
B = imread('spot1-diff2.jpg');
C1 = A-B;
C = rgb2gray(C1);
[x,y] = size(C);
[M,N] = find(C>20);
z = size(M);
D = zeros(z(1),1);
imshow(A);
hold on;

for i = 1 : z(1)
    if D(i,1) == 0
        rectangle('Position',[N(i) M(i) x/20 y/20 ],'EdgeColor','r');
        D(i,1) = 1;
        for j = i+1:z(1)
            if abs(M(i)-M(j)) < (y/20)
                if abs(N(i)-N(j)) < (x/20)
                    D(j) = 1;
                end
            end
        end
    end
end
                
hold off;