%�����ź����
[y,Fs]=audioread('demo.mp4'); %��ȡ��Ƶ
%��ȡ������Ƶ
samples1 = [1,10*Fs];
samples2 = [10*Fs,20*Fs];
[y1,Fs]=audioread('demo.mp4',samples1);
[y2,Fs]=audioread('demo.mp4',samples2);
%��������
[m,n]=size(y1);%sizeȡ�����������
[m0,n0]=size(y2);
a=zeros(abs(m-m0),n);%������������Ϊ���������
if length(y1)<length(y2)
     z=[y1;a];
     y3=z+y2;%������������һ��������ӣ�����Ҫ����
else 
     z=[y2;a];
     y3=z+y1;%y1��z1�г����Ǹ����䣬�̵��Ǹ�����
end;
sound(y3,Fs)