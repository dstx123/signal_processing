%ƽ��
I = imread('demo.jpg'); % ��ȡͼ��
[m, n] = size(I); % ��ȡͼ���С
res = zeros(m, n); % ����������ÿ�����ص�Ĭ�ϳ�ʼ��Ϊ0����ɫ��
delX = 50; % ƽ����X
delY = 50; % ƽ����Y
tras = [1 0 delX; 0 1 delY; 0 0 1]; % ƽ�Ƶı任���� 
for i = 1 : m
    for j = 1 : n
        temp = [i; j; 1];
        temp = tras * temp; % ����˷�
        x = temp(1, 1);
        y = temp(2, 1);
        % �任���λ���ж��Ƿ�Խ��
        if (x <= m) & (y <= n) & (x >= 1) & (y >= 1)
            res(x, y) = I(i, j);
        end
    end
end;
imshow(uint8(res)); % ��ʾͼ��