## matlab图像信号处理

### 一、图片文件读取

```matlab
I = imread('demo.jpg'); %读取图片
imshow(I); %显示图片
```

### 二、倍乘信号

```matlab
A = immultiply(I,2);
imshow(A);
```

### 三、相加

```matlab
B = imadd(I,A);
imshow(B);
```

### 四、相乘

```matlab
B = immultiply(I,A);
imshow(B);
```



### 五、微分

```matlab
%先定义一个mipforwarddiff函数
function dimg = mipforwarddiff(img,direction)
imgPad = padarray(img,[1 1],'symmetric','both');%将原图像的边界扩展
[row,col] = size(imgPad);
dimg = zeros(row,col);
switch (direction)   
case 'dx',
   dimg(:,1:col-1) = imgPad(:,2:col)-imgPad(:,1:col-1);%x方向差分计算，
case 'dy',
   dimg(1:row-1,:) = imgPad(2:row,:)-imgPad(1:row-1,:); 
otherwise, disp('Direction is unknown');
end;
dimg = dimg(2:end-1,2:end-1);

%在命令行中调用
forward_dx = mipforwarddiff(I,'dx');
imshow(forward_dx); %沿行方向微分
```



### 六、积分

```matlab
%先定义一个Integral函数
function I=Integral(Img) 
Img=double(Img);
[m,n]=size(Img);
I=zeros(m,n);
for i=1:m
    for j=1:n
        if i==1 && j==1             %积分图像左上角
            I(i,j)=Img(i,j);
        elseif i==1 && j~=1         %积分图像第一行
            I(i,j)=I(i,j-1)+Img(i,j);
        elseif i~=1 && j==1         %积分图像第一列
            I(i,j)=I(i-1,j)+Img(i,j);
        else                        %积分图像其它像素
            I(i,j)=Img(i,j)+I(i-1,j)+I(i,j-1)-I(i-1,j-1);  
        end
    end
end

%命令行中调用
Img=double(imread('demo.jpg'));
Int=Integral(Img);
imshow(Int/max(Int(:)));
```



### 七、尺度

```matlab
B = imresize(I,0.5);
imshow(B)
```



### 八、反褶

```matlab
I = imread('demo.jpg');
[m, n] = size(I);
res = zeros(m, n);

for i = 1 : m
    for j = 1 : n
        x = i;
        y = n - j + 1;
        res(x, y) = I(i, j);
    end
end

imshow(uint8(res));
```



### 九、平移

```matlab
I = imread('demo.jpg'); % 读取图像
[m, n] = size(I); % 获取图像大小
res = zeros(m, n); % 构造结果矩阵。每个像素点默认初始化为0（黑色）
delX = 50; % 平移量X
delY = 50; % 平移量Y
tras = [1 0 delX; 0 1 delY; 0 0 1]; % 平移的变换矩阵 

for i = 1 : m
    for j = 1 : n
        temp = [i; j; 1];
        temp = tras * temp; % 矩阵乘法
        x = temp(1, 1);
        y = temp(2, 1);
        % 变换后的位置判断是否越界
        if (x <= m) & (y <= n) & (x >= 1) & (y >= 1)
            res(x, y) = I(i, j);
        end
    end
end;

imshow(uint8(res)); % 显示图像
```



