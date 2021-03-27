function arrayLength = longestSequence(X)
% LONGESTSEQUENCE This function returns the maximum
% number of sequential elements in it's parameter 
% array. Function only works with vectors.
%
% Creator: Gökhan Koçmarlý - 150720821
% Created for EE2021 Final Exam in Marmara Uni.
% Time and Date: 26 January 2021 11:36

    % This function will firstly sort() and then
    % remove unwanted repetetive elements.
    Xnew = unique(X);
    
    % I'll put every consequential lenght in this
    % array. After that, I'll just want max() of it.
    lengthIndex = 1;
    groupLengths = zeros(size(X, 2), 1);
    % Temporary variable for counting. It's starting
    % from one because every element is in a group
    % philosophically.
    groupCount = 1;
    % In order not to have repetead elements.
    previousIsAGroup = false;
    
    % Looping through every element in array.
    for index = 2:size(Xnew, 2)
        % If current element is one more then the
        % previous element,
        if (Xnew(index) == (Xnew(index-1) + 1))
            % Adding one to the counter
            groupCount = groupCount + 1;
            % So, we find a group
            previousIsAGroup = true;
            
            % If that one is the last one of
            % array, we should insert it manually.
            if (index == size(Xnew, 2))
                groupLengths(lengthIndex) = groupCount;
            end
            
        % If it's not sequence and there was a group 
        % previous
        else
            if (previousIsAGroup)
                % Assigning the count to maxs matrix and
                % resetting all the values.
                groupLengths(lengthIndex) = groupCount;
                groupCount = 1;
                lengthIndex = lengthIndex + 1;
                previousIsAGroup = false;
            end
        end
    end
    
    % Retrieving max element in the array of every
    % groups max count.
    arrayLength = max(groupLengths);
end