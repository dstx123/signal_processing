%信号相加
I = imread('demo.jpg'); %读取图片
A = immultiply(I,2);
B = imadd(I,A);
imshow(B);