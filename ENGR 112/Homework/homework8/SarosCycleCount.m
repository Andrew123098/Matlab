function [sarosCalc] = SarosCycleCount(saros)
%SAROSCYCLECOUNT calculates the length of a saros cycle in days

%Do the needed year and month conversions into days
daysInASecond=1/86400; %Average number of days in a second
daysInAMinute=1/1440; %Average number of days in a minute
daysInAnHour=1/24; %Average number of days in an hour
daysInAMonth=30.44; %Average number of days in a month
daysInAYear=365.2425; %Average number of days in a year


%Calculate the first saros cycle (saros 127) using 2 given dates
firstsaros127=saros.Year(1)*daysInAYear+saros.Month(1)*daysInAMonth+saros.Day(1)+saros.Hour(1)*daysInAnHour+saros.Minute(1)*daysInAMinute+saros.Second(1)*daysInASecond; %day of first date
secondsaros127=saros.Year(12)*daysInAYear+saros.Month(12)*daysInAMonth+saros.Day(12)+saros.Hour(12)*daysInAnHour+saros.Minute(12)*daysInAMinute+saros.Second(12)*daysInASecond; %day of second date
saros127=secondsaros127-firstsaros127; %days between the 2 dates

%Calculate the second saros cycle (saros 142) using 2 given dates
firstsaros142=saros.Year(2)*daysInAYear+saros.Month(2)*daysInAMonth+saros.Day(2)+saros.Hour(2)*daysInAnHour+saros.Minute(2)*daysInAMinute+saros.Second(2)*daysInASecond; %day of first date
secondsaros142=saros.Year(13)*daysInAYear+saros.Month(13)*daysInAMonth+saros.Day(13)+saros.Hour(13)*daysInAnHour+saros.Minute(13)*daysInAMinute+saros.Second(13)*daysInASecond; %day of second date
saros142=secondsaros142-firstsaros142; %days between the 2 dates

%Calculate the average of the two saros cycles
sarosCalc=(saros127+saros142)/2;


