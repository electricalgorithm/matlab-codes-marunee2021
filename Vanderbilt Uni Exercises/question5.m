function output = question5(arr)
output = 0;
sorted = sort(arr);
sorted = sorted(sorted > 0);

for check = 1:(size(sorted, 2)-1)
    if (sorted(check+1)-1) - sorted(check) > eps
        output = sorted(check) + 1;
    end
end

if output == 0
   output = max(sorted) + 1;
end

end