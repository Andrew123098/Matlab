function [gradeLetter,leftover] = LetterGrade(grade)
%LETTERGRADE Changes a numeric grade to a letter grade

%Classify grade as A B or C

%if your grade is better than a 70, you have a C
if round(grade)>=70 || round(grade)<70
    gradeLetter0='C'; %make grade C
    leftover=grade-70; %find leftover
end

%if your grade is better than a 80, you have a B
if round(grade)>=80
    gradeLetter0='B'; %make grade B
    leftover=grade-80; %find leftover
end

%if your grade is better than a 70, you have a C
if round(grade)>=90  %if your grade is better than a 70, you have a C
    gradeLetter0='A'; %make grade A
    leftover=grade-90; %find leftover
end

%Classify grade as +, - or normal

%if your grade exists
if round(leftover)>=0 || round(leftover)<0
    gradeLetter=strcat(gradeLetter0,'-'); %grade has a -
end

%if your grade is better than a -
if round(leftover)>=2.5
    gradeLetter=gradeLetter0; %grade is normal
end

%if your grade is better than normal
if round(leftover)>=7.5
    gradeLetter=strcat(gradeLetter0,'+'); %grade has a +
end
end

