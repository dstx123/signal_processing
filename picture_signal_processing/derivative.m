%�ź�΢��
I = imread('demo.jpg'); %��ȡͼƬ
forward_dx = mipforwarddiff(I,'dx');
imshow(forward_dx); %���з���΢��