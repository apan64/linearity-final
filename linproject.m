I = imread('C:\Users\dpapp\Desktop\einstein.png','png');
imshow(I);
[width, height] = size(I)
A1 = I(1:8, 1:8);
for i = 1:width:8
    for j = 1:height:8
        block = I(i:i+8, j,j+8)
        greyscale_block = 
    end
end
imshow(A1);