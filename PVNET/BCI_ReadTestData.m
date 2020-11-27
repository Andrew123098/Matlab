% Andrew Brown PVNet EEG Read Data

clc
clear all

% This program will read in the data from an EEG sensor on someone's head
% and do statistical analysis on the data in order.

data1=dlmread('OpenBCI_Data.txt',',',[7, 1,236942,1]);

%fid=fopen('OpenBCI_Data.txt','w');


%filetext=fileread('OpenBCI_Data.txt');

%string=fscanf(fid,'%s');

%strrep(filetext,':',',');

%opts = detectImportOptions('OpenBCI_Data.txt');
%varNames = opts.VariableNames; % variable names

%varTypes = {'categorical','datetime','double','double','datetime','categorical'}; 
%opts = setvartype(opts,varNames,varTypes);             




