%信号微分
I = imread('demo.jpg'); %读取图片
forward_dx = mipforwarddiff(I,'dx');
imshow(forward_dx); %沿行方向微分