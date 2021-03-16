%信号微分
[y,Fs]=audioread('demo.mp4'); %读取音频
dy = diff(y); %差分
sound(dy,Fs);