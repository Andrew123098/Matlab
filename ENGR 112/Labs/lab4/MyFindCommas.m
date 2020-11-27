function [commaLocations,nCountQuotes,nCommasInQuotes] = MyFindCommas(myStr)
%MyFindCommas: This piece of code records the location of commas in the string, but
% ONLY if the comma is not between two quotes.
%INPUT: myStr is a string that contains some number of
%commas and quoted strings

commaLocations = []; % List of comma locations found
nCountQuotes = 0; % Count the number of quoted strings found
nCommasInQuotes = 0; % Count number of commas in quotes

% Keep track of if we're in a quoted string or not
bInQuote = false; % Start as false - not in quote

% Go through each character in the string...
for k = 1:length(myStr)
    % If we're between quotes then don't count commas - just look for "
    if bInQuote
        % Found matching quote - no longer in quotes
        if myStr(k) == '"'
            bInQuote = false;
        elseif myStr(k) == ','
            nCommasInQuotes = nCommasInQuotes + 1;
        end
    elseif myStr(k) == '"'
        % Found quote - turn on flag that we're in quotes and increment
        %  quote counter
        bInQuote = true;
        nCountQuotes = nCountQuotes + 1;
    elseif myStr(k) == ','
        % NOT in a quote and found a comma - record it's position
        commaLocations = [commaLocations k];
    end
end
end

