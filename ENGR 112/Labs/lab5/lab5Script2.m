%Andrew Brown Lab 5 Problem 2

clc
clear

%Print out and calculate statistics from script 1

% Script to read in 2D array of grade data
% Also provides column names
dataN = csvread('DataClass.csv');
strColumns = {' LabQuiz', ' zyBooks', ...
    ' Labs', ' Homeworks', ...
    ' MidtermI', ' MidtermII', ' Final', ...
    ' ExamAverage', ' Grade'};

for i=1:size(dataN,2)
    colData=dataN(:,i); %Gets the first column of the data.
    fprintf(strcat('Average %0.2f for item',strColumns{i},'\n'),mean(colData)); %Print out individual averages
end

%Calculate number of people with lab>HW and HW>Final
indexLabColumn=3; %index lab column
indexHWColumn=4; %index HW column
indexFinalColumn=7; %index Final exam column
betterLabThanHomework=0; %initialize Lab>HW variable
betterHWThanFinal=0; %initialize HW>Final exam variable
for j=1:size(dataN,1)
    if dataN(j,indexLabColumn)> dataN(j,indexHWColumn) %if Lab>HW
        betterLabThanHomework=betterLabThanHomework+1; %add 1 to variable
    end
    if dataN(j,indexHWColumn)> dataN(j,indexFinalColumn) %if HW>Final
        betterHWThanFinal=betterHWThanFinal+1; %add 1 to variable
    end
end

%Average difference between the labs and HWs and the HWs and final
lab=dataN(:,3); % all of the lab grades
HW=dataN(:,4); %all of the HW grades
final=dataN(:,7); % all of the final exam grades
LabHW=mean(lab-HW); %average difference of labs vs. HW
HWFinal=mean(HW-final); %average difference of HWs vs. final exam

%Print out results
fprintf('\nNumber of people with lab scores higher than homeworks: %0.0f\n',betterLabThanHomework) %Print how many did better on labs than on HW
fprintf('Average Difference: %0.2f\n',LabHW) % print average difference of labs vs hw
fprintf('Number of people with homework scores higher than final exam: %0.0f\n',betterHWThanFinal) %Print how many did better in HW than the final exam
fprintf('Average Difference: %0.2f\n',HWFinal) %print average difference of HW vs final exam
fprintf('Total number of students: %0.0f\n', length(colData)) %Total number of students