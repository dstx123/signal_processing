%信号积分
[y,Fs]=audioread('demo.mp4'); %读取音频
y2 = cumtrapz(y); %梯形法积分
sound(y2,Fs);