%·΄ρή
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