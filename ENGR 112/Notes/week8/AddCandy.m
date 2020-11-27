function [ candyList ] = AddCandy( candyList, strCandyName, candyCost)
%AddCandy Add a candy type to the candy struct
%   Make sure to add in one element to each array
%   This is one of the few times when the input and the output
%   should be the same because you're adding to the struct

%% LAB TIP: You will end up adding another input parameter called candyGoodness to this function. 
%   To make this work you will also need to update what happens in the if
%   else statements below

% First check to see if we have a list yet in the struct
%  If so, just add it in, otherwise need to make the field
%     isfield asks if there is a field called CandyCost in the struct

%% This branch will execute if the structure candyList is defined. 
%   Values will be added to each field using the array [] operator.
if isfield( candyList, 'CandyCost' )
    candyList.CandyName = [ candyList.CandyName, strCandyName ];
    candyList.CandyCost = [ candyList.CandyCost, candyCost ];
    candyList.CandyAmount = [ candyList.CandyAmount, 0 ]; % none, yet
    %% LAB TIP: Add another line here that will add a candyGoodness value to an
    % existing field called CandyGoodness using the [] operator. 
    
%% This branch will execute if the structure candyList is not yet defined. 
%   New fields will be created and edited.
else    
    candyList.CandyName = cell(1,1);    % Create a field named CandyName
    candyList.CandyName{1} = strCandyName; % Add a name to the field named CandyName
    candyList.CandyCost = candyCost; % Create a field named CandyName
    candyList.CandyAmount = 0;
    %% LAB TIP: Be sure to create the CandyGoodness field and assign a value to it here. 
end

% Just count the amount of names so that you can save the number of candies in the structure. 
candyList.numCandyTypes = length( candyList.CandyName );    

end

