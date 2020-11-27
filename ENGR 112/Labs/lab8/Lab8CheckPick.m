%% Script to check your PickCandy function
%    Change the "CHANGE HERE" bits
%
%  Key matlab concepts
%    Structs - how to save data in one "variable"
%    Optimization - how to iteratively improve on something
%    More practice with functions, program flow

clear
clc

% Read in and setup candy
% CHANGE HERE: Make sure this is your function and your data file
candy = GetCandy('CandyData.txt');

cost = candy.CandyCost;
goodness = candy.CandyGoodness;
rank = candy.CandyRank;

%% The code to do the checking
% Basically, call your function many, many times and see if it creates the
% same probability/rank values 
candyPicked = zeros( size( rank ) );
for k = 1:100000
    %% CHANGE HERE: change the function MyPickCandy 
    %     See instructions in MyPickCandy
    picked = MyPickCandy( rank );
    % Record which one was picked
    candyPicked( picked ) = candyPicked( picked ) + 1;
end

% Normalize and set to same range of values as rank
candyPicked = sum( rank ) .* candyPicked ./ sum( candyPicked );

%% CHECK HERE: The current version of MyPickCandy should
%   produce roughly equal numbers (i.e., something like 3.1 2.9 3.05)
% Once MyPickCandy is correct these two arrays should be
%   fairly similar (i.e., something like 3 2 4 and 3.10 1.9 4.1)
disp( candy.CandyRank );
disp( candyPicked );
