%ƽ��
[y,Fs]=audioread('demo.mp4'); %��ȡ��Ƶ
a=zeros(100000,2); %�����
y2 = [a;y];
sound(y2,Fs);