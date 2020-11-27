%Andrew Brown Homwork 8 Problem 3

clc
clear

%Total Solar Eclipse Part 4 Redux w/ structs passing through the function
%Read the file with the data and consolidate the data by column
data=dlmread('TSEData.csv'); %read in the file using dlmread
saros.Num=data(:,1);
saros.Month=data(:,2);
saros.Day=data(:,3);
saros.Year=data(:,4);
saros.Saros=data(:,5);
saros.Hour=data(:,6);
saros.Minute=data(:,7);
saros.Second=data(:,8);
saros.Mag=data(:,9);
saros.Hour2=data(:,10);
saros.Minute2=data(:,11);
saros.Second2=data(:,12);

%Use 2 given pairs of saros dates to calculate the length of a saros cycle
[sarosCalc] = SarosCycleCount(saros); %call calculating fucntion
fprintf('SarosCalc = %0.3f\n',sarosCalc) %print my calculated saros cycle

[enhancedSarosCalc] = EnhancedSarosCycleCalc(saros);
fprintf('EnhancedSarosCalc = %0.3f\n',enhancedSarosCalc)

%Calculate the dates of future TSEs using datevec function
firstSarosNum=ones(9,1); %preallocate variable
secondSarosNum=ones(9,1); %preallocate variable
Y=ones(9,1); %preallocate variable
M=ones(9,1); %preallocate variable
D=ones(9,1); %preallocate variable
for i=3:11 %call the proper indices from the imported file
    firstSarosNum(i-2)=datenum([saros.Year(i),saros.Month(i),saros.Day(i),saros.Hour(i),saros.Minute(i),saros.Second(i)]); %get the date numbers of the past TSEs
    secondSarosNum(i-2)=firstSarosNum(i-2)+enhancedSarosCalc; %calculate the date nums of future TSEs
    [Y(i-2),M(i-2),D(i-2)] = datevec(secondSarosNum(i-2)); %convert date nums to actual dates
end

%Define numbers for writing
sarosNum=([152 139 126 136 146 133 120 130 145]); %define saros numbers
count=14:23; %define counting numbers

%Print out the dates in the command window
fprintf('Date          Saros\n') %Command window column titles
for i=1:length(sarosNum)
    fprintf('%0.0f/%0.0f/%0.0f      %0.0f\n',D(i),M(i),Y(i),sarosNum(i)) %print
end

%Create a matrix out of the calcualted data to write to the data file
matrix=ones(9,5); %preallocate matrix
for i=1:length(sarosNum)
    matrix(i,:)=[count(i),M(i),D(i),Y(i),sarosNum(i)];
end

%Append the data file with the new data calculated
dlmwrite('TSEData.csv',matrix,'-append','delimiter',',')



