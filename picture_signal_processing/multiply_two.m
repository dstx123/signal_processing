%�ź����
I = imread('demo.jpg'); %��ȡͼƬ
A = immultiply(I,2);
B = immultiply(I,A);
imshow(B);