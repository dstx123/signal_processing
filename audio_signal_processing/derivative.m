%�ź�΢��
[y,Fs]=audioread('demo.mp4'); %��ȡ��Ƶ
dy = diff(y); %���
sound(dy,Fs);