  %% Candy store problem
%    Optimize out how much candy I can buy for one dollar
%
%  Key matlab concepts
%    Structs - how to save data in one "variable"
%    Optimization - how to iteratively improve on something
%    More practice with functions, program flow

clear
clc
clf

%% Read in and setup candy
% Input: filename
% Output: struct with the candy types, values, amounts
candy = GetCandy('CandyData.txt');

%% Simple optimization - start with the most expensive candy and add in
%   until the cost is too much, then switch to the next most expensive

%% First thing - have to determine which candy is the most expensive
% Don't want to re-arrange the struct so make an array that stores the
% order to go through
[~, sortedByCost] = sort( candy.CandyCost );
% Reverse order - sort goes from low to high
sortedByCost = sortedByCost(end:-1:1);

% Target value: $1
targetCost = 100;

%% An example of greedy optimization - just keep adding in the next biggest one
% Keep track of the number of tries
nTry = 0;
% For each candy type
for k = 1:length( sortedByCost )
    % Grab the next expensive one
    tryCandy = sortedByCost(k);
    
    % How much does it cost to add this candy in?
    costToAddCandy = candy.CandyCost( tryCandy );
    % Keep adding one in until we run out of pennies
    while CalculateCandyCost( candy ) + costToAddCandy <= targetCost
        candy.CandyAmount( tryCandy ) = candy.CandyAmount( tryCandy ) + 1;
        
        % Just so we can see what happens
        plot(nTry, CalculateCandyCost( candy), '*k');
        nTry = nTry + 1;
        hold on;
    end
end

% Horizontal line at target cost
plot( [0 nTry], [targetCost, targetCost], '-r');
xlabel('N Loops');
ylabel('Cost in $');
title('Greedy optimization');

% What did we end up with?
PrintCandy( candy );

 