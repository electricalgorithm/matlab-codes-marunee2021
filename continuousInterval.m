function [optimalPasswords, duration] = continuousInterval(doorPasswords)
% CONTINUOUSINTERVAL Calculate the most repeated duos in a sequance.
% This code is written by Gökhan Koçmarlý in MATLAB R2019a
% for EE2021 course midterm exam given by Asst. Prof. Onur Cihan.
% Question 4, Platform: Windows 10, Date: 07.12.2020

% Initilization
passSize = size(doorPasswords, 2);
solutionMatrix = zeros(3, passSize-1);
%  Solution matrix template:
%  First Row: Password 1
%  Second Row: Password 2
%  Third Row: Duration

% Bellow here is for calculating every duos interval/duration.
% "passSize-1" because we're choosing duos every iteration.
% After this loop, we will have a matrix that has all duos
% on first and second row with it's duration on third row.
for index = 1:passSize-1
   firPass = doorPasswords(1, index);
   secPass = doorPasswords(1, index+1);
   % This logic array will return us a index array which its 
   % elements are either firPass or secPass. 
   seqArr = find(doorPasswords == firPass | doorPasswords == secPass);
   % This function will find the starting point of the sequ-
   % ence indices that we found before in seqArr.
   seqStarts = [true; diff(seqArr(:)) ~= 1];
   % Grouping them for implementing as input for histc() function.
   seqGroup = cumsum(seqStarts);
   % histc() function will count how many elements does
   % each group have and store it in seqCount array.
   % I  can say that seqCount stores durations for duos.
   seqCount =  histc(seqGroup, 1:seqGroup(end));
   % I'm choosing the maximum duration.
   maxDuration = max(seqCount);
   
   % Insterting to solution matrix with template
   % which I explain before.
   solutionMatrix(:, index) = [firPass, secPass, maxDuration];
end

% Now, I have to choose max duration and then output it's
% passwords. In order to do that, I'll use sortrows() function
% and inverse-sort columns with the values in third row. Then
% assign the first column to output arguments/parameters.
sortedSolMat = sortrows(solutionMatrix', 3, 'descend')';

% !! IMPORTANT NOTE: As you see here, this code will only get
% last sequenced numbers. I mean, the code I write would not
% understand the similarity between [1, 2] and [2, 1]. It will
% return which one is the last. The question didn't say anything
% about this. But, I'll sort() the optimalPasswords before func-
% tion returns.
answer = sortedSolMat(:, 1);

% Output arguments assignments.
optimalPasswords = sort(answer(1:2));
duration = answer(3);

end