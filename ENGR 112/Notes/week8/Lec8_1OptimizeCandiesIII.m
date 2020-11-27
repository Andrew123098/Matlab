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

% Read in and setup candy
candy = GetCandy('CandyData.txt');

% Target value: $1
targetCost = 100;

%% Want to get as close to $1 as possible. 
% Random search - use random numbers to try options
% Keep best one found so far

% Define a function so we can re-use it later
BestFunc = @(candy, targetCost) abs( targetCost - CalculateCandyCost( candy ) );

% Keep the best guess found so far, as measured by closesness to target
% Save cost and candy amounts that gave us that cost
candyBest = candy;
costBest = BestFunc( candy, targetCost );

% Keep track of number of times through loop
count = 0;
nTry = 0;
% Keep randomly adding and deleting candies
while CalculateCandyCost( candy ) ~= targetCost && count < 10
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

    % See if we did better than before
    costNew = BestFunc( candy, targetCost );
    if costNew < costBest && CalculateCandyCost( candy ) <= targetCost
        % Yes! Save this answer
        costBest = costNew;
        candyBest = candy;
        
        % Reset this counter
        count = 0;
        
        % Plot so we see what's happening
        plot(nTry, CalculateCandyCost( candy), '*r');
    else
        % Plot so we see what's happening
        plot(nTry, CalculateCandyCost( candy), '*k');
    end
    
    % Increment counter for both total number of tries and
    %   tries since last time got a better answer
    count = count + 1;
    nTry = nTry + 1;
    hold on;
   
    % Print amounts so we can see what's happening
    fprintf('Candy amounts: %0.0f %0.0f ', ...
        sum(candy.CandyAmount), CalculateCandyCost( candy ) );
    disp( candy.CandyAmount );
end


% Horizontal line at target cost
plot( [0 nTry], [targetCost, targetCost], '-r');

xlabel('N Loops');
ylabel('Cost in $');
title('Narrow gap optimization');

% What did we end up with? Note candyBest, not candy
fprintf('Best answer found\n');
PrintCandy( candyBest );

 