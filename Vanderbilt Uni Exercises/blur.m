function output = blur(img, w)
% BLUR blur a uint8 datatype (img) with given multiplier (w)
img = uint16(img);
[sizeR, sizeC] = size(img);
temp = uint16(ones(sizeR+2*w, sizeC+2*w)*0);
temp(1+w:end-w, 1+w:end-w) = img + uint16(ones(sizeR, sizeC));
output = uint8(zeros(sizeR, sizeC));
indexR = 1;

for inR = (1+w):(size(temp, 1)-w)
    indexC = 1;
    for inC = (1+w):(size(temp, 2)-w)
        nonZeroCount = sum(temp(inR-w:inR+w, inC-w:inC+w) > 0, 'all');
        output(indexR, indexC) = uint8(round(sum(...
            temp(inR-w:inR+w, inC-w:inC+w)-uint16(ones(2*w+1, 2*w+1)),...
            'all')/nonZeroCount));
        indexC = indexC + 1;
    end
    indexR = indexR + 1;
end
end