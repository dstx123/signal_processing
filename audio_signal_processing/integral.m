%�źŻ���
[y,Fs]=audioread('demo.mp4'); %��ȡ��Ƶ
y2 = cumtrapz(y); %���η�����
sound(y2,Fs);