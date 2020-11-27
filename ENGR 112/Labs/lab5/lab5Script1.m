%Andrew Brown Lab 5 Problem 1

clc
clear
close all

%Plot last year's ENGR112 data by type

% Script to read in 2D array of grade data
% Also provides column names
dataN = csvread('DataClass.csv');
strColumns = {'LabQuiz', 'zyBooks', ...
    'Labs', 'Homeworks', ...
    'MidtermI', 'MidtermII', 'Final', ...
    'ExamAverage', 'Grade'};

strLineStyles = {'--b', ':b', '-k', '--k', ':g', '--g', '.g', '-g', '-r'}; %Line Styles
for i=1:size(dataN,2)
    hold on
    colData=dataN(:,i); %Gets the first column of the data.
    plot(sort(colData),strLineStyles{i},'linewidth',1) %plot each of the 9 columns sorted from high to low
    
end

counter=1:size(dataN,1); %make a counter from 1 to the length of dataN
for j=70:10:90 %count in intervals of 10
    hold on
    hLine=ones(1,length(dataN));%create an array of ones length dataN long
    plot(counter,j.*hLine,'-r') %plot 3 horizontal lines at 70 80 and 90
end

legend(strColumns,'Location','NW') %plot the legend with the given names in the top right corner
title('ENGR 112 Scores') %title the graph
xlabel('Student Numbers') %add x label
ylabel('Score (from 100)') %add y label

