%% Import data from spreadsheet
% Script for importing data from the following spreadsheet:
%
%    Workbook: C:\Users\andre\OneDrive\Documents\GEEN3583\Kalimba_Regression_Data.xlsx
%    Worksheet: Sheet1

%% Setup the Import Options and import the data
opts = spreadsheetImportOptions("NumVariables", 2);

% Specify sheet and range
opts.Sheet = "Sheet1";
opts.DataRange = "E9:F627";

% Specify column names and types
opts.VariableNames = ["Stress", "Strain"];
opts.VariableTypes = ["double", "double"];

% Import the data
raw = readtable("C:\Users\andre\OneDrive\Documents\GEEN3583\Kalimba_Regression_Data.xlsx", opts, "UseExcel", false);

%% Convert to output type
raw = table2array(raw);

%% Clear temporary variables
clear opts