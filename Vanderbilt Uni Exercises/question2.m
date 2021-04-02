function output = question2(arr, k)
output = false;
for indexControl = 1:max(size(arr))
    for indexMultiply = 1:max(size(arr))
        if indexControl ~= indexMultiply
            checkVal = arr(indexControl) + arr(indexMultiply);
            if checkVal == k
                output = true;
                return
            end
        end
    end
end
end