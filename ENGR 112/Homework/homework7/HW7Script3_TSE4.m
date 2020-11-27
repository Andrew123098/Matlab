%Andrew Brown Homwork 7 Problem 3

clc
clear

%Total Solar Eclipse Part 4
%Read the file with the data and consolidate the data by column
data=dlmread('Data.csv'); %read in the file using dlmread
num=data(:,1);
month=data(:,2);
day=data(:,3);
year=data(:,4);
saros=data(:,5);
hour=data(:,6);
minute=data(:,7);
second=data(:,8);
mag=data(:,9);
hour2=data(:,10);
minute2=data(:,11);
second2=data(:,12);

%Use 2 given pairs of saros dates to calculate the length of a saros cycle
[sarosCalc] = SarosCycleCount(second,minute,hour,day,month,year); %call calculating fucntion
fprintf('SarosCalc = %0.3f\n',sarosCalc) %print my calculated saros cycle

[enhancedSarosCalc] = EnhancedSarosCycleCalc(second,minute,hour,day,month,year);
fprintf('EnhancedSarosCalc = %0.3f\n',enhancedSarosCalc)

%Calculate the dates of future TSEs using datevec function
firstSarosNum=ones(9,1); %preallocate variable
secondSarosNum=ones(9,1); %preallocate variable
Y=ones(9,1); %preallocate variable
M=ones(9,1); %preallocate variable
D=ones(9,1); %preallocate variable
for i=3:11 %call the proper indices from the imported file
    firstSarosNum(i-2)=datenum([year(i),month(i),day(i),hour(i),minute(i),second(i)]); %get the date numbers of the past TSEs
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
dlmwrite('Data.csv',matrix,'-append','delimiter',',')



