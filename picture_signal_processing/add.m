%�ź����
I = imread('demo.jpg'); %��ȡͼƬ
A = immultiply(I,2);
B = imadd(I,A);
imshow(B);