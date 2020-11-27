%% File Info
% Andrew Brown
% 10/18/20
% GEEN 3853
% The purpose of this file is to analyze the class data from our coffee cup
% experiment. 

%% Import data from spreadsheet
% Script for importing data from the following spreadsheet:
%
%    Workbook: CoffeeCupThresholdTimes.xlsx
%    Worksheet: Sheet1

%% Prepare workspace
clear all 
close all
clc

%% LOAD DATA
%load as "table" for more versatility (readtable)

raw = readtable('CoffeeCupThresholdTimes.xlsx');

ds_full = raw;

%What is in this dataset? summary(ds), head(ds,3)
summary(ds_full)

%% Simplify the dataset
ds = ds_full(:,8);
%head(ds, 1)

%% Split into Lid and No Lid Arrays with only Times data

noLidData = table2array(ds(1:11,1));    % Stores the time in minutes the coffee stayed at the ideal temperature range with the lid off.
lidData = table2array(ds(12:22, 1));    % Stores the time in minutes the coffee stayed at the ideal temperature range with the lid on.
coffeeMugData = table2array(ds(23,1 )); % Stores the time in minutes the coffee stayed at the ideal temperature range in a coffee mug (only 1 peice of data).

%% DESCRIPTIVE STATS - VISUAL

% %% Descriptive stats: Continuous
% Plot (No Lid Histogram)
figure
h = histogram(noLidData);
xlabel('Minutes')
ylabel('No Lid Coffee Cups')
title('No Lid Coffee Cup Times')


% No Lid Relative Frequency
figure
h = histogram(noLidData, 'Normalization', 'probability');
xlabel('No Lid Coffee Cups')
ylabel('Relative Frequency')
title('No Lid Coffee Cup Time Probability')


% %% Descriptive stats: Continuous
% Plot (Lid Histogram)
figure
h = histogram(lidData);
xlabel('Minutes')
ylabel('Lid Coffee Cups')
title('Lid Coffee Cup Times')


% Lid Relative Frequency
figure
h = histogram(lidData, 'Normalization', 'probability');
xlabel('Lid Coffee Cups')
ylabel('Relative Frequency')
title('Lid Coffee Cup Time Probability')

% Put Probability Distributions on the same Plot for Visual Appeal

% No Lid Probability Distribution Function based on this sample:
figure
ksdensity(noLidData);
xlabel('Minutes')
ylabel('Probability')
hold on

% Lid Probability Distribution Function based on this sample:
ksdensity(lidData);
legend('No Lid', 'Lid','Location','SouthEastOutside');
title('Lid and No Lid Probability Distribution');
axis([0, 60, 0, 0.2]);
hold off


%% DESCRIPTIVE STATS - NUMERIC
% Mean (mean)
mnD = nanmean(noLidData)
% Median (median)
medD = nanmedian(noLidData)
% Mode (mode)
modD = mode(noLidData)
%When multiple values occur equally frequently, mode returns the smallest #

% Standard Deviation (std)
sdD = nanstd(noLidData)
% Variance (var)
varD = nanvar(noLidData)
% Range (max() - min() or range)
rgD = range(noLidData)


% Mean (mean)
mnR = nanmean(lidData)
% Median (median)
medR = nanmedian(lidData)
% Mode (mode)
modR = mode(lidData)
%When multiple values occur equally frequently, mode returns the smallest #

% Standard Deviation (std)
sdR = nanstd(lidData)
% Variance (var)
varR = nanvar(lidData)
% Range (max() - min() or range)
rgR = range(lidData)

%% TEST OF NORMALITY

%Plot the data. The "normplot" function makes a normal probabiltiy plot of
%the data.  The purpose of this plot is to graphically assess whethere the 
%data could come from a normal distribution.  The data is assumed to be 
%normally distributed if the data points appear to fall on the linear 
%regression line.  

figure
normplot (noLidData)
title('No Lid Normal Probability Plot');

figure
normplot (lidData)
title('Lid Normal Probability Plot');

%Next we want to use the "adtest" function to run the Anderson-Darling 
%goodness-of-fit test. Often we reject the null hypothesis (that data is 
%normally distributed) with significance level of 0.05.
%The Null hypothesis can be rejected if 
%ADTEST > Critical Value (CV). For more information, remember that you can
%always use the "help" function in Matlab.

[H,P,ADSTAT,CV]=adtest(noLidData, 'Alpha', 0.05)
 
[H,P,ADSTAT,CV]=adtest(lidData, 'Alpha', 0.05)

%% TEST OF VARIANCE

% Calculate the variances directly.
noLidVariance = (std(noLidData))^2
lidVariance = (std(lidData))^2

% Calculate a 2 sample ftest to see if the samples has statistically
% significant variances.
[H,P,CI,STATS] = vartest2(noLidData,lidData,'alpha',0.05,'tail','both')

%% TEST OF LOCATION

% We will do a 2 sample ttest to test the two samples means. They will be
% two tailed and, as indicated from the above variences, have assumed
% unequal variences.

alpha1 = 0.05;

[H,P,CI,STATS] = ttest2(noLidData,lidData,'alpha',alpha1,'tail','both','Vartype','unequal')

%% Conclusion
% The Anderson-Darling tests on both sets of data failed to reject the null hypothesis that the data 
% is normally distributed. Using that result, we can assume normality, and use the ftest and ttest. 
% The ttest resulted in the rejection of the null hypothesis that the means are statistically the same, 
% allowing us to conlude that because the lid data has a statistically significant higher average value 
% of about 21 minutes as compared to the no lid data's average of 14 minutes, a lid on a coffee cup will 
% reliably keep coffee at its ideal drinking temperature for longer. However, from the adtest, we can also 
% conclude the that increase in variability due to the lid makes the exact increase in time in the ideal 
% drinking temperature range unpredictable.
