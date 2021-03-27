function coins = numberOfCoins(totalAmount, paidAmount)
% NUMBEROFCOINS A function to tell you minimum number of
% coin in order to pay the client's remainder money.
% Parameters needs to be scalar numbers.
% This code is written by Gökhan Koçmarlý in MATLAB R2019a
% for EE2021 course midterm exam given by Asst. Prof. Onur Cihan.
% Question 1, Platform: Windows 10, Date: 07.12.2020

% Initilization of coins as row-vector.
coinTypes = [1, 5, 10, 25, 50, 100];
numberOfCoins = size(coinTypes, 2);

% Firstly I have to substract the value from the money.
moneyToGive = paidAmount - totalAmount;
if moneyToGive < 0
    error("The customer paid less than the total amount of the transaction.");
end

% I will multiply the result with 100 for
% adoption to our coinTypes[] values.
moneyToGive =  int32(moneyToGive * 100);

% Algorithm is as follows.
outputVector = zeros(1, numberOfCoins);
index = numberOfCoins;
while index > 0
    % I tried different approches here because when
    % program check for 10 == 10.000, it consider as 
    % "10-10=-5e-15" and eps() doesn't work. To solve
    % this problem, I used a type converter int32()
    % and change the value float to integer. That's
    % because line 18 has the functtion int32().
    while moneyToGive - coinTypes(1, index) >= 0
        moneyToGive = moneyToGive - coinTypes(1, index);
        outputVector(1, index) = outputVector(1, index) + 1;
    end
    index = index - 1;
end

% Summing the values in the vector, to show output.
coins = sum(outputVector);
end