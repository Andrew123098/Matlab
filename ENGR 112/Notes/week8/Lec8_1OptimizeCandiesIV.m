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

%% Want to get as close to $1 as possible while having (within +-1) roughly
%  the same number of each type of candies. 
% Random search - use random numbers to try options
bKeepTrying = true;

% Define a function so we can re-use it later
BestFunc = @(candy, targetCost) abs( targetCost - CalculateCandyCost( candy ) );

% Keep the best guess found so far, as measured by closesness to target
% Save cost and candy amounts that gave us that cost
candyBest = candy;
costBest = BestFunc( candy, targetCost );

% Count number of times through loop
nTry = 0;
% Count number of times since we last saw an improvement
nTrySinceBest = 0;
while bKeepTrying == true
    % Either add or remove a candy - pick which one at random
    if CalculateCandyCost( candy ) < targetCost
        % Only pick those who's counts are less than the others
        minVal = min( candy.CandyAmount );
        minVals = find( candy.CandyAmount == minVal );
        % Get one of the minVals at random
        tryAdd = minVals( randi( length(minVals) ) );
        candy.CandyAmount(tryAdd) = candy.CandyAmount(tryAdd)+1;

    elseif CalculateCandyCost( candy ) > targetCost
        % Only pick those who's counts are bigger than the others
        maxVal = max( candy.CandyAmount );
        maxVals = find( candy.CandyAmount == maxVal );
        % Get one of the minVals at random
        tryAdd = maxVals( randi( length(maxVals) ) );
        candy.CandyAmount(tryAdd) = candy.CandyAmount(tryAdd)-1;

    else
        candyBest = candy;
        bKeepTrying = false;
    end
    
    % See if we did better than before
    costNew = BestFunc( candy, targetCost );
    if costNew < costBest && CalculateCandyCost( candy ) <= targetCost
        % Yes! Save this answer
        costBest = costNew;
        candyBest = candy;
        
        % Reset this counter
        nTrySinceBest = 0;
        
        % Plot so we see what's happening
        plot(nTry, CalculateCandyCost( candy), '*r');
    else
        % Plot so we see what's happening
        plot(nTry, CalculateCandyCost( candy), '*k');
    end
    
    % If we've gone too long, just stop
    if nTrySinceBest > 25
        bKeepTrying = false;
    end

    % Increment both counters
    nTry = nTry + 1;
    nTrySinceBest = nTrySinceBest + 1;
    
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

 