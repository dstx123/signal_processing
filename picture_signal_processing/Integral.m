function I=Integral(Img) 
Img=double(Img);
[m,n]=size(Img);
I=zeros(m,n);
for i=1:m
    for j=1:n
        if i==1 && j==1             %����ͼ�����Ͻ�
            I(i,j)=Img(i,j);
        elseif i==1 && j~=1         %����ͼ���һ��
            I(i,j)=I(i,j-1)+Img(i,j);
        elseif i~=1 && j==1         %����ͼ���һ��
            I(i,j)=I(i-1,j)+Img(i,j);
        else                        %����ͼ����������
            I(i,j)=Img(i,j)+I(i-1,j)+I(i,j-1)-I(i-1,j-1);  
        end
    end
end