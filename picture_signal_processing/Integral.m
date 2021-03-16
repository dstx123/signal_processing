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