%% Script to read in 2D array of grade data
% Also provides column names
dataN = csvread('DataClass.csv');
strColumns = {'LabQuiz', 'zyBooks', ...
              'Labs', 'Homeworks', ...
              'MidtermI', 'MidtermII', 'Final', ...
              'ExamAverage', 'Grade'};

% Line styles
strLineStyles = {'--b', ':b', '-k', '--k', ':g', '--g', '.g', '-g', '-r'};

%% Add noise to the data (+- 1) and write it out
% rand generates a 2D array of noise in the range of 0 to 1
%  shift and scale
noise = 2 * (rand( size(dataN) ) - 1.0);
dataN = dataN + noise;
csvwrite('DataClassWithNoise.csv', dataN)

