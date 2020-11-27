function  [cost] = CalculateCandyCost( candyList )
%% Add up the current cost of my candy
% candyList is a struct of the form
%   List of candy types (strings)
%   List of candy costs (numbers)
%   List of number of each candy

% Element-wise multiplication
cost = sum( candyList.CandyCost .* candyList.CandyAmount );

end