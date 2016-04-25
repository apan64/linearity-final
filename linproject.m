IMG = imread('C:\Users\dpapp\Documents\GitHub\linearity-final\einstein.png','png');
IMG = rgb2gray(IMG);
[width, height, dim] = size(IMG)

blockSizeR = 8;
blockSizeC = 8;

wholeBlockRows = floor(width / blockSizeR);
blockVectorR = [blockSizeR * ones(1, wholeBlockRows), rem(width, blockSizeR)]
wholeBlockCols = floor(height / blockSizeC);
blockVectorC = [blockSizeC * ones(1, wholeBlockCols), rem(height, blockSizeC)]

if dim > 1
    blocks = mat2cell(IMG, blockVectorR, blockVectorC, dim);
else
    blocks = mat2cell(IMG, blockVectorR, blockVectorC);
end

for i = 1:width/8
    for j = 1:height/8
        matDCT = dct2(blocks{i, j})
    end
end