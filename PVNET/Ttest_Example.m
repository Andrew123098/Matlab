%% Andrew Brown PVNet Ttest Example
% Oct. 18, 2019
clc
clear all

%two fields of barley sample 1 and sample 2
%Which field has a higher yield?
%The mean only tells us so much, it does not tell
%anything about variance or outliers
%This is why we use the ttest.

field1 = [15.2, 15.3, 16.0, 15.8, 15.6, 14.9, 15.0, 15.4, 15.6, 15.7, ...
    15.5, 15.2, 15.5, 15.1, 15.3, 15.0];
field2 = [15.9, 15.9, 15.2, 16.6, 15.2, 15.8, 15.8, 16.2, 15.6, 15.6, ...
    15.8, 15.5, 15.5, 15.5, 14.9, 15.9];

%First we need our averages for each field
mean1 = mean(field1);
mean2 = mean(field2);

%Second we take the standard deviation for each field
stdev1 = std(field1);
stdev2 = std(field2);

%Third we take the variance for each field
%which is the square of the standard deviation.
%So, we can do this calculation in 2 ways, using
%the var fucntion, or mathmatically.
fvariance1 = var(field1);
fvariance2 = var(field2);

variance1 = (stdev1)^2;
variance2 = (stdev2)^2;

%Fourth, we calculate the number of data points taken in each sample.
n1 = length(field1);
n2 = length(field2);
%**Note: we can also use the size fucntion to get both array dimensions.

%Now we get to calculate our t-value, which we use in the t-test
tValue = abs(mean1 - mean2)/(sqrt((variance1/n1)+((variance2)/n2)));

%Print out the t-value
fprintf("T-Value: %.2f\n", tValue);

%%  Conducting the T-Test:
%A t-test is testing our null hypothesis (H0), which is that
%there is NO statistically significant difference between the two samples
%So we identify a Critical Value where if our t-value is lower, we dont
%reject our H0, and if it is higher, we reject the H0.
%Now we refer to a t-table.

%First we choose a p-value, which is how accurate we want to be.
%Generally people  use a p-value of p=0.05, which means that 95% of the
%time e would reject the H0.

%Second, we calculate our degree of freedom, which is our total number of
%samples minus 2: df = n1 + n2 - 2 = 30

%Therefore, with a CV of 2.04 and a t-value of 2.3, we can reject the null
%hypothesis. It is reasonable to conlcude that there is some statistical
%difference between our fields. However, it is smaller than CV for p=0.025,
%so we would have to take that into consideration if publishing a paper
%using this data. The smaller the p-value, the more likely we can reject
%the null hypothesis.

%% Lets use the T-test function:
%Recruit Difficulty:
H0 = ttest2(field1, field2);
fprintf("Simple code: H = %.0f\n", H0);
fprintf("Therefore, we can reject the null hypothesis with a default p-value of p = 0.05\n");

%Veteran Difficulty
[H0,pVal,confidenceInterval,STATS] = ttest2(field1, field2, 'alpha', 0.05, 'tail', 'both', 'vartype', 'equal');

%Use if statement to decide what to print to the command window
fprintf("\nComplex code:\n");
if H0 == 0 %same as saying if H0 == 0 or if H0 == false
    fprintf("The null hypothesis cannot be rejected.\n");
elseif H0  %same as saying if H0 == 1 or if H0 == true
    fprintf("The null hypothesis has been rejected.\n");
else %if there is something wrong with your code and H0 returns 'unknown'
    fprintf("Error in using ttest2() fucntion");
end

%Print out all of our data
fprintf("     P-Value = %.7f\n", pVal);
fprintf("     T-Value = %.4f\n", abs(STATS.tstat));
fprintf("     CI = [%.3f , %.3f]\n", confidenceInterval(1), confidenceInterval(2));
fprintf("     %.0f Degrees of Freedom\n", STATS.df);

