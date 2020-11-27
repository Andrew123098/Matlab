%Andrew Brown Homework 3 Problem 3

clc
clear
close all

%Continuation of HW3 Problem 2 TSE with practice using loops, if
%statements, user inputs with arrays and other matlab operators.


%Part 1A: Create three variables: Year, Month, and Day. These three
%variables should contain a vector of the corresponding values of the
%TSE dates.

%Defining the three time-based variables with the given data.
day=[2,14,4,20,8,12]; %Days of the future TSE
month=[7,12,12,4,4,8]; %months of the future TSE
year=[2019,2020,2021,2023,2024,2026]; %years of the future TSE

%Part B: Calculate how many days between January 1st, 2018 and each of
%the upcoming TSE dates. Use the assumption that the Gregorian (western)
%solar calendar month, on average has 30.44 days. And every year has on
%average 365.2425 days.

%Do the needed year and month conversions into days
daysInAMonth=30.44; %Average number of days in a month
daysInAYear=365.2425; %Average number of days in a year

%Set up the arrays into only days for the end calculation
daysSubtracted=736695; %Days before Jan. 1, 2018
monthsToDays=(month-1).*daysInAMonth; %convert months to days
yearsToDays=(year-1).*daysInAYear; %convert years to days

%Calculation of days between Jan 1, 2018 and the given TSEs
daysUntilTSE=yearsToDays+monthsToDays+day-daysSubtracted;
roundedDaysUntilTSE=round(daysUntilTSE);


%PART 3


%Calculate the average of the difference between consecutive TSEs
avgDif=mean(diff(daysUntilTSE)); %in days

%Calculate 150 TSE dates that will happen after Aug. 11, 1999
lastTSE=(1998*daysInAYear)+(7*daysInAMonth)+11; %days before Aug. 11, 1999
saveDate=zeros(1,150); %Preallocate savedate
for i=1:150
    tseDate=avgDif.*i+lastTSE;%calculate the date
    saveDate(i)=tseDate; %save the date to a preallocated array
    if saveDate(i)<=(2099*daysInAYear) %Calculate the TSE that will happen between 2001 and 2100
        saveBetterDate(i)=saveDate(i); %Save values into new array
    end
end

%Count all the TSEs that occur between 2001 and 2100
numTSE=length(saveBetterDate); %caluclate the length of the saveBetterDate array
disp(numTSE) %display the length in days
