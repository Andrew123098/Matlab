% Starting script for Lab 4: Create a function from code
% Name:Andrew Brown

% Usual clear/clc to clear command window and variables
clear;
clc;

% Open up a text file with some text in it
fid = fopen('DataFileLab4.txt', 'r');
% Read in the text file as one string
myStr = fscanf(fid, '%s'); % %s says read in as string
% Good practice - close file
fclose(fid);


% Replace code with a call to your created function
[commaLocations,nCountQuotes,nCommasInQuotes] = MyFindCommas(myStr);

% Print out results
fprintf('Found %0.0f quoted strings and %0.0f commas\n', nCountQuotes, length(commaLocations) );
fprintf('Comma locations: ');
disp(commaLocations)
fprintf('Found %0.0f commas in quoted strings\n',nCommasInQuotes)

