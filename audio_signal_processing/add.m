%两个信号相加
[y,Fs]=audioread('demo.mp4'); %读取音频
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