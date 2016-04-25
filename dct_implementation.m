I = im2double(rgb2gray(imread('einstein.png','png')));
[r, c, d] = size(I);
if((mod(r, 8) ~= 0) || (mod(c, 8) ~= 0))
    Q = zeros(r + (8 - mod(r, 8)), c + (8 - mod(c, 8)));
    for rn = 1:r
        for cn = 1:c
           Q(r, c) = I(r, c);
        end
    end
    [r, c, d] = size(I);
end
T = dctmtx(8);
dct = @(block_struct) T * block_struct.data * T';
B = blockproc(I,[8 8],dct);
for rn = 1:8:r
    for cn = 1:8:c
        for r2 = 2:8
            for c2 = 2:8
                if(r2 + c2) > 5
                    B(rn + r2, cn + c2) = 0;
                end
            end
        end
    end
end
% works up to compressing the image and discarding high frequency values
% currently doesn't store the values in a smaller matrix