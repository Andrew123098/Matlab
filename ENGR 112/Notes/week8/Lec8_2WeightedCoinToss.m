%% Example of histogram sampling
% Fancy weighted coin flip 

clear;
clc;
clf;

% For figure
nRows = 1;
nCols = 2;

%% How much I would like to see each of the following
%    - i.e., the likelihood of each
probs = [ 0.2 0.7 1.2];

% What is the probability of each?
sumProbs = sum( probs );
for k = 1:size(probs,2)
    fprintf('Probability of item %0.0f is %0.2f = ', k, probs(1,k) / sumProbs );
    fprintf('%0.2f / %0.2f\n', probs(k), sumProbs )
    probs(2,k) = probs(1,k) / sumProbs;
end

% Plot as bars
subplot(nRows, nCols, 1 );
bar( probs );
xlabel('Choice');
ylabel('Liklihood');
title('Weighted coin flip');

% Plot likelihoods as one big bar
subplot(nRows, nCols, 2 );
bar(probs, 'stacked');
ylabel('Liklihood');
title('Stacked');
