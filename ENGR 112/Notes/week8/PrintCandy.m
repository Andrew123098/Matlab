function [  ] = PrintCandy( candy )
%PrintCandy Print out the current amount of candy neatly
%  Include total cost

fprintf('Current cost of candy: %0.2f\n', CalculateCandyCost(candy) );

% Header to label table
%   make sure spaced evenly
% Save string format
strFormat = '%-12s %-6s %-6s %-6s\n';
fprintf(strFormat, 'Candy', 'Cost', 'Num', 'Total');

% Convert to number format
sLocs = strfind( strFormat, 's' );
% Don't change first %s
sLocs(1) = [];
% Work backwards so that locs stays the same length
for k = length( sLocs ):-1:1
    % Swap out the %s for %.2f
    loc = sLocs(k);
    strReplace = '.2f';
    if k == 2
        strReplace = '.0f';
    end
    strFormat = strcat( strFormat(1:loc-1), strReplace, strFormat(loc+1:end) );
end

% Now print out candies and amounts
for k = 1:candy.numCandyTypes
    fprintf(strFormat, candy.CandyName{k}, candy.CandyCost(k), ...
        candy.CandyAmount(k), candy.CandyCost(k) * candy.CandyAmount(k));
end

end

