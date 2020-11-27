function [sarosCalc] = SarosCycleCount(second,minute,hour,day,month,year)
%SAROSCYCLECOUNT calculates the length of a saros cycle in days

%Do the needed year and month conversions into days
daysInASecond=1/86400; %Average number of days in a second
daysInAMinute=1/1440; %Average number of days in a minute
daysInAnHour=1/24; %Average number of days in an hour
daysInAMonth=30.44; %Average number of days in a month
daysInAYear=365.2425; %Average number of days in a year


%Calculate the first saros cycle (saros 127) using 2 given dates
firstsaros127=year(1)*daysInAYear+month(1)*daysInAMonth+day(1)+hour(1)*daysInAnHour+minute(1)*daysInAMinute+second(1)*daysInASecond; %day of first date
secondsaros127=year(12)*daysInAYear+month(12)*daysInAMonth+day(12)+hour(12)*daysInAnHour+minute(12)*daysInAMinute+second(12)*daysInASecond; %day of second date
saros127=secondsaros127-firstsaros127; %days between the 2 dates

%Calculate the second saros cycle (saros 142) using 2 given dates
firstsaros142=year(2)*daysInAYear+month(2)*daysInAMonth+day(2)+hour(2)*daysInAnHour+minute(2)*daysInAMinute+second(2)*daysInASecond; %day of first date
secondsaros142=year(13)*daysInAYear+month(13)*daysInAMonth+day(13)+hour(13)*daysInAnHour+minute(13)*daysInAMinute+second(13)*daysInASecond; %day of second date 
saros142=secondsaros142-firstsaros142; %days between the 2 dates

%Calculate the average of the two saros cycles
sarosCalc=(saros127+saros142)/2;


