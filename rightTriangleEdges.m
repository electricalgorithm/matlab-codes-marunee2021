function myList = rightTriangleEdges(listOfIntegers)
% RIGHTTRIANGLEEDGES Function to find x^2 + y^2 = z^2 triplets.
% This code is written by Gökhan Koçmarlý in MATLAB R2019a
% for EE2021 course midterm exam given by Asst. Prof. Onur Cihan.
% Question 3, Platform: Windows 10, Date: 07.12.2020

% I used three for iteration to calculate every possible
% and then if one found, I returned.
% index for x, jndex for y and zndex for z.
for index = 1:size(listOfIntegers, 2)
    for jndex = 1:size(listOfIntegers, 2)
        for zndex = 1:size(listOfIntegers, 2)
            % To avoid same number complication, I used 
            % the approach bellow.
            if index ~= jndex && jndex ~= zndex && index ~= zndex
                % Calculating squares of x, y and z.
                xSq = listOfIntegers(index)^2;
                ySq = listOfIntegers(jndex)^2;
                zSq = listOfIntegers(zndex)^2;
                if xSq + ySq == zSq
                    myList = [listOfIntegers(index),...
                        listOfIntegers(jndex), listOfIntegers(zndex)];
                    return
                end
            end
        end
    end
end

% If for loops didn't find anything and not returned, then
% function will output myList as an empty array.
myList = [];
end