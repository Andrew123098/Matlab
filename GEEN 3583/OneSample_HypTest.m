%One Sample t-test example
% Nick Stites
% GEEN 3853
% Fall 2020

%% INTRO
%For the 1-sample test, let’s test the hypothesis that the annual rate of 
%return for the stock market over time is 8%.  For this data, let’s start 
%1/1/1958 (the S&P adopted 500 stocks in 1957, 
%https://www.investopedia.com/ask/answers/042415/what-average-annual-return-sp-500.asp) 
%and go to 1/1/2018.  We will only want the 1/1 data for each year, and 
%we need to calculate the % increase in the index for each year.  
%The annual % increase is what we will test against 8%.

%The S&P 500 is a weighted and aggregated valuation of 500 companies that
%are representative of the broader economy.

%% Prepare workspace
clear all 
close all
clc

%% LOAD DATA
%load as "table" for more versatility (readtable)

raw = readtable('sp500_data.csv');

ds_full = raw;

%What is in this dataset? summary(ds), head(ds,3)
summary(ds_full)

%% Simplify the dataset
ds = ds_full(:,{'Date', 'SP500'});
head(ds, 2)
% 
%% Clean the data; fix data types (nominal or categorical )
% We only want the data for the 1/1 of each year, starting 1/1/1958.
temp = year(ds.Date) >= 1958;
%ds(1045,:)
%ds58 = ds(1045:12:end,:)
ds58month = ds(temp,:)
ds58 = ds58month(1:12:end,:)

%% Calculate annual rate of return
    %Neglecting inflation and dividends
ds58.ARR(1) = nan;
for ii =2:height(ds58)
ds58.ARR(ii) = (ds58.SP500(ii)-ds58.SP500(ii-1))/ds58.SP500(ii-1);
end

summary(ds58)
%nanmean(ds58.ARR)

%% DESCRIPTIVE STATS - VISUAL

% %% Descriptive stats: Continuous
% Plot (histogram)
figure
h = histogram(ds58.ARR);
xlabel('Annual Rate of Return')
ylabel('Counts')

%Relative Frequency
figure
h = histogram(ds58.ARR, 'Normalization', 'probability');
xlabel('Annual Rate of Return')
ylabel('Relative Frequency')

%Probability Distribution Function based on this sample:
figure
ksdensity(ds58.ARR);
xlabel('Annual Rate of Return')
ylabel('Probability Density')

%QUESTION: Why are some values greater than one?!

%% DESCRIPTIVE STATS - NUMERIC
% Mean (mean)
mn = nanmean(ds58.ARR)
% Median (median)
med = nanmedian(ds58.ARR)
% Mode (mode)
mod = mode(ds58.ARR)
%When multiple values occur equally frequently, mode returns the smallest #

% Standard Deviation (std)
sd = nanstd(ds58.ARR)
% Variance (var)
var = nanvar(ds58.ARR)
% Range (max() - min() or range)
rg = range(ds58.ARR)


%% TEST OF NORMALITY
%Plot the data. The "normplot" function makes a normal probabiltiy plot of
%the data.  The purpose of this plot is to graphically assess whethere the 
%data could come from a normal distribution.  The data is assumed to be 
%normally distributed if the data points appear to fall on the linear 
%regression line.  
 
normplot (ds58.ARR)

%Next we want to use the "adtest" function to run the Anderson-Darling 
%goodness-of-fit test. Often we reject the null hypothesis (that data is 
%normally distributed) with significance level of 0.05.
%The Null hypothesis can be rejected if 
%ADTEST > Critical Value (CV). For more information, remember that you can
%always use the "help" function in Matlab.

[H,P,ADSTAT,CV]=adtest(ds58.ARR, 'Alpha', 0.05)

%% TEST OF VARIANCE
%None needed for the 1-sample t-test.

%% TEST OF LOCATION
%Choose the Type 1 error rate. Remember, "alpha" is a function in Matlab, 
%so a1 is chosen for this variable name. 

alpha1 = 0.05;

%------------------------One Sample Test------------------------------%
mu0 =  0.08;  %enter specified mean parameter/ given mean value (scalar)

%This function runs a t-test on data that is normally distributed.
%Reject the null hypothesis when H = 1, accept null when H = 0 
%P is the p-value.  CI is the confidence interval for the true population
%mean. It is the (1-alpha)*100 percent CI.
%"STATS" will return the t-statistic, degrees of freedom, 
%and the estimated population standard deviation 
%(our best guess of the pop. stand. dev. is the sample standard deviation). 
%Finally, the 'tail' must be specified as a two-tailed test ('both'), 
%or a one-tailed test ('left' or 'right'). For more information, use help.

[H,P,CI,STATS] = ttest(ds58.ARR,mu0,'alpha',alpha1,'tail','both')
%-------------------------------------------------------------------------%

%% Proof of CI
t_cf = tinv(1 - 0.025, length(ds58.ARR)-1)
int = t_cf*nanstd(ds58.ARR)/sqrt(length(ds58.ARR))
mn = nanmean(ds58.ARR)
[mn - int, mn + int]

% We will go over confidence intervals later.


%% Effect Size
%Coming soon