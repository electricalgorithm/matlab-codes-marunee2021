function output = question1(arr)
if prod(arr) ~= 0 % For faster results, if not contain 0.
    output(:) = prod(arr)./arr(:);
else
    output = zeros(size(arr)); % Pre-allocation
    for index = 1:max(size(arr))
        productVector = arr([1:index-1; index+1:end]);
        output(index) = prod(productVector);
    end
end
end