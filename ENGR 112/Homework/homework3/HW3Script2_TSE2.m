%Andrew Brown Homework 3 Problem 2

clc
clear
close all

%Continuation of HW2 Problem 2 TSE budgeting with practice using loops, if
%statements and user inputs with arrays.

%Total Solar Eclipse Part 1

%Part A: Create three variables: Year, Month, and Day. These three 
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
%Part C: Calculate the daily saving balance that you will accumulate in 
%your account starting from day one until and ending on day 3,200. 
%(Assume that you are adding $2/day into your account. No interest is 
%added to your saving account). Assign the daily savings of all 3,200 
%values into one array.

%Ask the user for the required budget
budget=input('Required Budget: $');

%PART 2 START

%Ask the user to input their daily and initial savings starting from 1-1-2018
savings=input('Daily savings starting 1-1-2018: $'); %user input savings in $
initialSavings=input('Intial savings on 1-1-2018: $'); %user input initial savings in $
dailySavingsBalance=initialSavings:savings:11^4; %Array for the daily savings that counts by your dailysavings and starts at your initial savings

%Create a counter for i that breaks when you can afford a trip or when you
%cannot afford any trips
i=1;
while roundedDaysUntilTSE(i)*savings+initialSavings<budget
    i=i+1; %increase i when you cannot afford the trip
    if i==6
        break %if you cannot afford any trip, break the if statement and while loop
    end
end

%Produces the correct statement based on whether or not you can afford any
%eclipse
if i==6
    fprintf('Your savings budget will not allow you to attend any of the upcoming eclipses.\n'); %print when you cannot afford any trip
else
    fprintf('With a required budget of $%0.2f you can attend the following total solar eclipse(s):\n',budget); %print when you can afford a trip
end

%Prints out the needed values for the eclipses that you can afford.
for j=1:6
    if roundedDaysUntilTSE(j)*savings+initialSavings>=budget %if your savings are more than or equal to your budget
        fprintf('A total solar eclipse that occurs on %0.0f days with a savings balance of $%0.0f\n',roundedDaysUntilTSE(j),roundedDaysUntilTSE(j)*savings+initialSavings) %print out which trips you can afford
    end
end

%Part 1 D: Generate a plot that shows all of the following:
%1. The value of your daily savings.
%2. Plot a marker on the plot for each TSE and your savings that day.
%3. Plot a dashed horizontal line for savings = $3000
%4. Print out how many days are left until the first TSE you can afford and
%their savings balance that day.


countDays=1:length(dailySavingsBalance); %Array to count the days in order

%Plot the Solar Eclipse Budget Simulation
plot(countDays,dailySavingsBalance,'b')
title('Solar Eclipse Budget Simulation')
xlabel('Days')
ylabel('Money Saved ($)')
hold on

%Plot a horizontal line at y=3000 using the ines function
horizontalLine=ones(1,length(countDays));
plot(countDays,budget.*horizontalLine,'--k')

%Plot each solar eclipse date and savings.
plot(roundedDaysUntilTSE(1),dailySavingsBalance(roundedDaysUntilTSE(1)),'xr','MarkerSize',10) %2019 eclipse
plot(roundedDaysUntilTSE(2),dailySavingsBalance(roundedDaysUntilTSE(2)),'*r','MarkerSize',10) %2020 eclipse
plot(roundedDaysUntilTSE(3),dailySavingsBalance(roundedDaysUntilTSE(3)),'+r','MarkerSize',10) %2021 eclipse
plot(roundedDaysUntilTSE(4),dailySavingsBalance(roundedDaysUntilTSE(4)),'sg','MarkerSize',10) %2023 eclipse
plot(roundedDaysUntilTSE(5),dailySavingsBalance(roundedDaysUntilTSE(5)),'dg','MarkerSize',10) %2024 eclipse
plot(roundedDaysUntilTSE(6),dailySavingsBalance(roundedDaysUntilTSE(6)),'og','MarkerSize',10) %2026 eclipse

%Create the legend in the SW corner
legend('Savings','Required Budget','2019 Eclipse','2020 Eclipse','2021 Eclipse','2023 Eclipse','2024 Eclipse','2026 Eclipse','location','SE')
