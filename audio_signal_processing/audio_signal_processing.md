## Matlab 音频信号处理

### 一、读取音频文件

函数名：$audioread$

调用格式：

- [y,Fs] = audioread(filename)
- [y,Fs] = audioread(filename,samples)

使用方法：

```matlab
[y,Fs]=audioread('C:\Users\user\Desktop\audio_signal_processing\demo.mp4');
```

**Fs**：采样频率，1秒内对连续的音频信号取的点的个数
**y**：输出的音频数字信号，默认是n行2列，其中2的意思是，这个音频信号是两个声道的，n的值等于该音频信号的时长乘采样频率Fs。
**samples** ：音频读取区域，samples其实是一个数组，意思就是一段音频比如是1分钟，但是我只需要读取一部分，比如0-20s，20s-40s，40s-最后

```matlab
[y,Fs]=audioread('demo.mp4'); %读取音频
sound(y,Fs); %播放音频
clear sound; %停止播放
```

### 二、倍乘信号

```matlab
sound(2*y,Fs) %两倍声音放大
```

### 三、相加

```matlab
%截取两端音频
samples1 = [1,10*Fs];
samples2 = [10*Fs,20*Fs];
[y1,Fs]=audioread('demo.mp4',samples1);
[y2,Fs]=audioread('demo.mp4',samples2);
%混音处理
[m,n]=size(y1);%size取矩阵的行列数
[m0,n0]=size(y2);
a=zeros(abs(m-m0),n);%两矩阵行数差为零矩阵行数
if length(y1)<length(y2)
     z=[y1;a];
     y3=z+y2;%两个矩阵行数一样才能相加，所以要补零
else 
     z=[y2;a];
     y3=z+y1;%y1和z1中长的那个不变，短的那个补零
end;
sound(y3,Fs)
```

### 四、相乘

```matlab
%截取两端音频
samples1 = [1,10*Fs];
samples2 = [10*Fs,20*Fs];
[y1,Fs]=audioread('demo.mp4',samples1);
[y2,Fs]=audioread('demo.mp4',samples2);
%混音处理
[m,n]=size(y1);%size取矩阵的行列数
[m0,n0]=size(y2);
a=zeros(abs(m-m0),n);%两矩阵行数差为零矩阵行数
if length(y1)<length(y2)
     z=[y1;a];
     y3=z.*y2;%两个矩阵点乘
else 
     z=[y2;a];
     y3=z.*y1;
end;
sound(y3,Fs)
```

### 五、微分

```matlab
dy = diff(y); %差分
sound(dy,Fs);
```

### 六、积分

```matlab
y2 = cumtrapz(y); %梯形法积分
sound(y2,Fs);
```

### 七、尺度

```matlab
sound(y,2*Fs);     %二倍速播放声音
```

### 八、反褶

```matlab
L = size(y,1);%得到语音总共取到的点的个数
n = 1:L;
y2 = y(L-n+1,1); %实现语音信号反褶并平移到原点处
sound(y2,Fs);
```

### 九、平移

```
a=zeros(100000,2); %零矩阵
y2 = [a;y];
sound(y2,Fs);
```



