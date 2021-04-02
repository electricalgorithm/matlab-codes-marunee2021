% Saddle Point Calculator
function saddlePoints = saddle(matrix)
sizeOf = size(matrix);
rowsMax = [];
colsMin = [];
saddlePoints = [];

if sizeOf(1) == 0 || sizeOf(2) == 0
    return;
end

% rowsMax process
for row = 1:sizeOf(1)
   rowsMax = [rowsMax; matrix(row, 1), row, 1];
   for col = 2:sizeOf(2)
       if matrix(row, col) > rowsMax(end, 1)
           rowsMax(end, :) = [matrix(row, col), row, col];
       elseif matrix(row, col) == rowsMax(end, 1)
           rowsMax = [rowsMax; matrix(row, col), row, col];
       end
   end
end

% colsMin process
for col = 1:sizeOf(2)
    colsMin = [colsMin; matrix(1, col), 1, col];
    for row = 2:sizeOf(1)
        if matrix(row, col) < colsMin(col, 1)
            colsMin(end, :) = [matrix(row, col), row, col];
        elseif matrix(row, col) == colsMin(end, 1)
            colsMin = [colsMin; matrix(row, col), row, col];
        end
    end
end

% Checking for same values
[sizeRow, ~] = size(rowsMax);
[sizeCol, ~] = size(colsMin);
for check1 = 1:sizeRow
    for check2 = 1:sizeCol
        if rowsMax(check1, :) == colsMin(check2, :)
            saddlePoints = [saddlePoints; ...
                rowsMax(check1, 2), rowsMax(check1, 3)];
        end
    end
end   
end