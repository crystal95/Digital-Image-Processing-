close all;
a=imread('spot2-diff1.png');
shapeInserter = vision.ShapeInserter;
rectangle = int32([10 10 30 30]);
J = step(shapeInserter, a, rectangle);
figure();
imshow(J); 
