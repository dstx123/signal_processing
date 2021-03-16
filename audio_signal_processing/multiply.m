%信号倍乘2
[y,Fs]=audioread('demo.mp4'); %读取音频
sound(2*y,Fs) %两倍声音放大