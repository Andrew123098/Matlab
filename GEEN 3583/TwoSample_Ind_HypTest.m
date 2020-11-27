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
temp = (1940 >= year(ds.Date)) & (year(ds.Date)) >= 1930;
%ds(1045,:)
%ds58 = ds(1045:12:end,:)
dsDepressionMonth = ds(temp,:)
dsDepression = dsDepressionMonth(1:12:end,:)

temp = (2018 >= year(ds.Date)) & (year(ds.Date)) >= 2008;
%ds(1045,:)
%ds58 = ds(1045:12:end,:)
dsRecessionMonth = ds(temp,:)
dsRecession = dsRecessionMonth(1:12:end,:)

%% Calculate annual rate of return
    %Neglecting inflation and dividends
dsDepression.ARR(1) = nan;
for ii =2:height(dsDepression)
dsDepression.ARR(ii) = (dsDepression.SP500(ii)-dsDepression.SP500(ii-1))/dsDepression.SP500(ii-1);
end

summary(dsDepression)
%nanmean(ds58.ARR)

 %Neglecting inflation and dividends
dsRecession.ARR(1) = nan;
for ii =2:height(dsRecession)
dsRecession.ARR(ii) = (dsRecession.SP500(ii)-dsRecession.SP500(ii-1))/dsRecession.SP500(ii-1);
end

summary(dsRecession)
%nanmean(ds58.ARR)
%% DESCRIPTIVE STATS - VISUAL

% %% Descriptive stats: Continuous
% Plot (histogram)
figure
h = histogram(dsDepression.ARR);
xlabel('Annual Rate of Return')
ylabel('Counts')

%Relative Frequency
figure
h = histogram(dsDepression.ARR, 'Normalization', 'probability');
xlabel('Annual Rate of Return')
ylabel('Relative Frequency')

%Probability Distribution Function based on this sample:
figure
ksdensity(dsDepression.ARR);
xlabel('Annual Rate of Return')
ylabel('Probability Density')

%QUESTION: Why are some values greater than one?!

% %% Descriptive stats: Continuous
% Plot (histogram)
figure
h = histogram(dsRecession.ARR);
xlabel('Annual Rate of Return')
ylabel('Counts')

%Relative Frequency
figure
h = histogram(dsRecession.ARR, 'Normalization', 'probability');
xlabel('Annual Rate of Return')
ylabel('Relative Frequency')

%Probability Distribution Function based on this sample:
figure
ksdensity(dsRecession.ARR);
xlabel('Annual Rate of Return')
ylabel('Probability Density')

%QUESTION: Why are some values greater than one?!

%% DESCRIPTIVE STATS - NUMERIC
% Mean (mean)
mnD = nanmean(dsDepression.ARR)
% Median (median)
medD = nanmedian(dsDepression.ARR)
% Mode (mode)
modD = mode(dsDepression.ARR)
%When multiple values occur equally frequently, mode returns the smallest #

% Standard Deviation (std)
sdD = nanstd(dsDepression.ARR)
% Variance (var)
varD = nanvar(dsDepression.ARR)
% Range (max() - min() or range)
rgD = range(dsDepression.ARR)


% Mean (mean)
mnR = nanmean(dsRecession.ARR)
% Median (median)
medR = nanmedian(dsRecession.ARR)
% Mode (mode)
modR = mode(dsRecession.ARR)
%When multiple values occur equally frequently, mode returns the smallest #

% Standard Deviation (std)
sdR = nanstd(dsRecession.ARR)
% Variance (var)
varR = nanvar(dsRecession.ARR)
% Range (max() - min() or range)
rgR = range(dsRecession.ARR)


%% TEST OF NORMALITY
%Plot the data. The "normplot" function makes a normal probabiltiy plot of
%the data.  The purpose of this plot is to graphically assess whethere the 
%data could come from a normal distribution.  The data is assumed to be 
%normally distributed if the data points appear to fall on the linear 
%regression line.  
 
normplot (dsDepression.ARR)

%Next we want to use the "adtest" function to run the Anderson-Darling 
%goodness-of-fit test. Often we reject the null hypothesis (that data is 
%normally distributed) with significance level of 0.05.
%The Null hypothesis can be rejected if 
%ADTEST > Critical Value (CV). For more information, remember that you can
%always use the "help" function in Matlab.

[H,P,ADSTAT,CV]=adtest(dsDepression.ARR, 'Alpha', 0.05)


%Plot the data. The "normplot" function makes a normal probabiltiy plot of
%the data.  The purpose of this plot is to graphically assess whethere the 
%data could come from a normal distribution.  The data is assumed to be 
%normally distributed if the data points appear to fall on the linear 
%regression line.  
 
normplot (dsRecession.ARR)

%Next we want to use the "adtest" function to run the Anderson-Darling 
%goodness-of-fit test. Often we reject the null hypothesis (that data is 
%normally distributed) with significance level of 0.05.
%The Null hypothesis can be rejected if 
%ADTEST > Critical Value (CV). For more information, remember that you can
%always use the "help" function in Matlab.

[H,P,ADSTAT,CV]=adtest(dsRecession.ARR, 'Alpha', 0.05)

%% TEST OF VARIANCE
depressionVariance = (std(dsDepression.ARR))^2
recessionVariance = (std(dsRecession.ARR))^2
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

[H,P,CI,STATS] = ttest(dsDepression.ARR,mu0,'alpha',alpha1,'tail','both')
%-------------------------------------------------------------------------%

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

[H,P,CI,STATS] = ttest(dsRecession.ARR,mu0,'alpha',alpha1,'tail','both')
%-------------------------------------------------------------------------%



%% Proof of CI
t_cf = tinv(1 - 0.025, length(dsDepression.ARR)-1)
int = t_cf*nanstd(dsDepression.ARR)/sqrt(length(dsDepression.ARR))
mn = nanmean(dsDepression.ARR)
[mn - int, mn + int]

% We will go over confidence intervals later.

t_cf = tinv(1 - 0.025, length(dsRecession.ARR)-1)
int = t_cf*nanstd(dsRecession.ARR)/sqrt(length(dsRecession.ARR))
mn = nanmean(dsRecession.ARR)
[mn - int, mn + int]

% We will go over confidence intervals later.


%% Effect Size
%Coming soon
%-------------------------------------------------------------------------%

%% Conclusion
% For the 10 year period after the start of the Great Depression, the
% Average Rate of Return for the S&P90 was -0.29%.
% For the 10 year period after the start of the Great Recession, the
% Average Rate of Return for the S&P500 was +9.22%. 

