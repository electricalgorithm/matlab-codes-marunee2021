function output = question6(arr)
% Pre-allocation
temp = zeros(size(arr));

% Operations
for index = 1:size(arr, 2)
    if arr(index) == index
        temp(index) = index;
    end
end
output = temp(temp > 0);

% If there's no fixed point.
if isempty(output)
    output = false;
    disp("No fixed point exist in given list.");
end