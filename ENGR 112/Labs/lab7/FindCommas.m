function [ commas, strAll ] = FindCommas( fid )
%FindCommas Read a csv file line with commas as deliminators
%   Deals with commas in "" correctly

commas = [];
bInQuote = false;

str = fgets(fid);
pos = 1;
strAll = str;
while bInQuote == true || length(commas) == 0
    bFound = false;
    for k = 1:length(str)
        if bInQuote
            if str(k) == '"'
                bInQuote = false;
                bFound = true;
            end
        elseif str(k) == '"'
            bInQuote = true;
            bFound = true;
        elseif str(k) == ','
            commas = [commas pos];
            bFound = true;
        end
        pos = pos + 1;
    end
    if bInQuote
        str = fgets(fid);
        strAll = [strAll, str];
    end
    if bFound == false
        fprintf('Looping\n')
    end
end

commas = [commas, length(str)];
end
