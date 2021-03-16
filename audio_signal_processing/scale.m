%信号尺度变换
[y,Fs]=audioread('demo.mp4'); %读取音频
sound(y,2*Fs);     %二倍速播放声音