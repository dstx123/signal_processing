%信号反褶变换
[y,Fs]=audioread('demo.mp4'); %读取音频
L = size(y,1);%得到语音总共取到的点的个数
n = 1:L;
y2 = y(L-n+1,1); %实现语音信号反褶并平移到原点处
sound(y2,Fs);