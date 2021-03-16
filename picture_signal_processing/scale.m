%信号尺度变换
I = imread('demo.jpg'); %读取图片
B = imresize(I,0.5);
imshow(B)