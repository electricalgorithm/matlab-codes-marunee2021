function returned = question4(arr)
returned = zeros(size(arr));
for index = 1:size(arr, 2)
    tempArr = arr(index+1:end);
    count = 0;
    for inindex = 1:size(tempArr, 2)
        if tempArr(inindex) < arr(index)
            count = count + 1;
        end
    end
    returned(1, index) = count;
end