function myList = findRegularNumbers(x)
% FINDREGULARNUMBERS Function to provide you a vector for regular numbers.
% This function is seeking regular numbers. Regular numbers means numbers
% of the powers of 2, 3 and 5. Return value is a row-vector.
% This code is written by Gökhan Koçmarlý in MATLAB R2019a
% for EE2021 course midterm exam given by Asst. Prof. Onur Cihan.
% Question 2, Platform: Windows 10, Date: 07.12.2020

% Pre-allocation
tempArr = zeros(1, x^3);

% Algorithm is as follows.
placeCounter = 1;
for index = 0:x
    for jndex = 0:x
        for zndex = 0:x
            tempArr(1, placeCounter) = (2^index)*(3^jndex)*(5^zndex);
            placeCounter = placeCounter + 1;
        end
    end
end

% Sorting and then selecting what user wants.
tempArr = sort(tempArr);
myList = tempArr(1, 1:x);
end
