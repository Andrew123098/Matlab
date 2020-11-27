%% Candy store problem
%    Optimize out how much candy I can buy for one dollar
%
%  Key matlab concepts
%    Structs - how to save data in one "variable"
%    Optimization - how to iteratively improve on something
%    More practice with functions, program flow
%    Use randomness to search

clear
clc
clf

% Read in and setup candy
candy = GetCandy('CandyData.txt');

% Target value: $1
targetCost = 100;

%% Want to get as close to $1 as possible. 
% Random search - use random numbers to try options

% Count number of times through loop
count = 0;

% Keep randomly adding and deleting candies
while CalculateCandyCost( candy ) ~= targetCost && count < 1000
    % Either add or remove a candy - pick which one at random
    pickOne = randi( candy.numCandyTypes );
    
    if CalculateCandyCost( candy ) < targetCost
        % Add one to this
        candy.CandyAmount(pickOne) = candy.CandyAmount(pickOne)+1;

    elseif CalculateCandyCost( candy ) > targetCost
        % Only remove one if that randomly picked one has one...
        if candy.CandyAmount( pickOne ) > 0
            candy.CandyAmount(pickOne) = candy.CandyAmount(pickOne)-1;
        end
    end
    
    % Plot so we see what's happening
    plot(count, CalculateCandyCost( candy), '*k');
    count = count + 1;
    hold on;
   
    % Print amounts so we can see what's happening
    fprintf('Candy amounts: %0.0f %0.0f ', ...
        sum(candy.CandyAmount), CalculateCandyCost( candy ) );
    disp( candy.CandyAmount );
end

% Horizontal line at target cost
plot( [0 count], [targetCost, targetCost], '-r');

xlabel('N Loops');
ylabel('Cost in $');
title('Narrow gap optimization');

% What did we end up with?
fprintf('Found\n');
PrintCandy( candy );
 