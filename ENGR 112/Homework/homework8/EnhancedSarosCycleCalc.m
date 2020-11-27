function [enhancedSarosCalc] = EnhancedSarosCycleCalc(saros)
%   ENHANCEDSAROSCYCLECLAC Caluclates the length of the saros cycle using
%   special matlab date functions

%Calculate the saros cycle for saros 127
firstsaros127=datenum([saros.Year(1),saros.Month(1),saros.Day(1),saros.Hour(1),saros.Minute(1),saros.Second(1)]); %first TSE date
secondsaros127=datenum([saros.Year(12),saros.Month(12),saros.Day(12),saros.Hour(12),saros.Minute(12),saros.Second(12)]); %second TSE date
saros127=secondsaros127-firstsaros127; %days between the 2 dates

%Calculate the saros cycle for saros 142
firstsaros142=datenum([saros.Year(2),saros.Month(2),saros.Day(2),saros.Hour(2),saros.Minute(2),saros.Second(2)]); %first TSE date
secondsaros142=datenum([saros.Year(13),saros.Month(13),saros.Day(13),saros.Hour(13),saros.Minute(13),saros.Second(13)]); %second TSE date
saros142=secondsaros142-firstsaros142;  %days between the 2 days

%calcualte the average between the 2 saros cycles
enhancedSarosCalc=(saros127+saros142)/2;
end