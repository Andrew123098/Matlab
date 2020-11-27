function [enhancedSarosCalc] = EnhancedSarosCycleCalc(second,minute,hour,day,month,year)
%   ENHANCEDSAROSCYCLECLAC Caluclates the length of the saros cycle using
%   special matlab date functions

%Calculate the saros cycle for saros 127
firstsaros127=datenum([year(1),month(1),day(1),hour(1),minute(1),second(1)]); %first TSE date
secondsaros127=datenum([year(12),month(12),day(12),hour(12),minute(12),second(12)]); %second TSE date
saros127=secondsaros127-firstsaros127; %days between the 2 dates

%Calculate the saros cycle for saros 142
firstsaros142=datenum([year(2),month(2),day(2),hour(2),minute(2),second(2)]); %first TSE date
secondsaros142=datenum([year(13),month(13),day(13),hour(13),minute(13),second(13)]); %second TSE date
saros142=secondsaros142-firstsaros142;  %days between the 2 days

%calcualte the average between the 2 saros cycles
enhancedSarosCalc=(saros127+saros142)/2;
end