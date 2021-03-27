function [nRegs, maxRegs] = numberofRegions(X)
% NUMBEROFREGIONS This function gets an boolean matrix and
% finds groups for ones with DFS algohritm. It returns group
% count and the maximum size of any group. If you want every
% size of every group, add "maxEveryRegs" to returned array.
%
% Creator: Gökhan Koçmarlı - 150720821
% Created for EE2021 Final Exam in Marmara Uni.
% Time and Date: 26 January 2021 11:01

    [sizeRow, sizeCol] = size(X);
    % I'll use a DFS algorithm and visiteds matrix.
    visited = zeros(sizeRow, sizeCol); % Zero = not Visited | One = Visited
    nRegs = 0;  % Region count
    maxEveryRegs = zeros(sizeRow*sizeCol, 1); % Max element in every region
    
    % This function will help to our DFS function,
    % so that it can work with if statements.
    function returnbool = isValid(row, col)
        returnbool = true;
        % Checking if it's out of grid.
        if (row < 1 || row > sizeRow ...
                || col < 1 || col > sizeCol)
            returnbool = false;
        end
        % Checking if it's visited or 0.
        if (returnbool == true)
            if (visited(row, col) == 1 || X(row, col) == 0)
                returnbool = false;
            end
        end
    end

    % This is the function which does the deep first
    % search algorithm recursively.
    function DFS_seeking(row, col)
        visited(row, col) = 1;
        maxEveryRegs(nRegs) = maxEveryRegs(nRegs) + 1;
        
        % Top Left Recursive
        if (isValid(row-1, col-1))
            DFS_seeking(row-1, col-1);
        end
        % Top Middle Recursive
        if (isValid(row-1, col))
            DFS_seeking(row-1, col);
        end
        % Top Right Recursive
        if (isValid(row-1, col+1))
            DFS_seeking(row-1, col+1);
        end
        % Middle Left Recursive
        if (isValid(row, col-1))
            DFS_seeking(row, col-1);
        end
        % Middle Right Recursive
        if (isValid(row, col+1))
            DFS_seeking(row, col+1);
        end
        % Bottom Left Recursive
        if (isValid(row+1, col-1))
            DFS_seeking(row+1, col-1);
        end
        % Bottom Middle Recursive
        if (isValid(row+1, col))
            DFS_seeking(row+1, col);
        end
        % Bottom Right Recursive
        if (isValid(row+1, col+1))
            DFS_seeking(row+1, col+1);
        end
    end
    
    % Looping throught every row.
    for indR = 1:sizeRow
        % Looping throught every column.
        for indC = 1:sizeCol
            % If that element is 1 and it is not visited.
           if (X(indR, indC) && ~visited(indR,indC))
               nRegs = nRegs + 1;
               DFS_seeking(indR, indC);
           end
        end
    end
    
    % After the finding every groups maximum,
    % we can get max() value in that array for maxRegs.
    maxRegs = max(maxEveryRegs);
    
end
