%% File Info
% Andrew Brown
% 9/20/20
% GEEN 3853
% The purpose of this file is to find the Elastic Modulus of a Kalimba
% Gauge.

%% Clear variables and workspace
clear all %clears all variables in workspace
close all %closes all figures
clc %clears command window

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
%% Breaking out individual variables
% Only do this if you have to; otherwise, try to keep related variables
% together and call them from their matrices
stress = raw(:,1);
strain = raw(:,2);

%% Curve fit tool
%See in the ribbon under Apps
%%
figure(1)
plot(strain, stress,'-o',...
    'LineWidth',1,...
    'MarkerSize',2)
xlabel('Strain')
ylabel('Stress (MPa)')
title('Stress vs. Strain Kalimba Gauge Response')
hold on

%% Find Young's Modulus
strainLinear = strain(51:119); %Only the Linear Portion of Strain on Stress Strain curve.
stressLinear = stress(51:119); %Only the Linear Portion of Stress on Stress Strain curve.
plot(strainLinear, stressLinear, 'LineWidth', 2) %Plot the Linear Slope on the Graph.
ElasticModulus = stressLinear./strainLinear; %Calculate Elastic Modulus at all points.
AverageElasticModulus = mean(ElasticModulus, 'all')/1000; %Calculate Average Elastic Modulus and convert to GPa.
fprintf('Elastic Modulus: %.3f\n GPa', AverageElasticModulus)





