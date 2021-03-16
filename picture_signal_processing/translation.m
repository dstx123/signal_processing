%平移
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