%Andrew Brown Lab 7 Problem 3

clc
clear

%Practice with strings

%Read the given file and store each of its values (use curly brackets to
%read out as strings instead of cells)
[dT,dN] = ReadData('ClassData.csv');
name1=dT{2,1};
name2=dT{3,1};
name3=dT{4,1};
name4=dT{5,1};
last1=dT{2,2};
last2=dT{3,2};
last3=dT{4,2};
last4=dT{5,2};
grade1=dN(2,3);
grade2=dN(3,3);
grade3=dN(4,3);
grade4=dN(5,3);

%Join the first and last names and take away any dashes
[name1] = JoinName(name1,last1); %1st row
[name2] = JoinName(name2,last2); %2nd row
[name3] = JoinName(name3,last3); %3rd row
[name4] = JoinName(name4,last4); %4th row

%Convert the numerical grades to letter grades
[gradeLetter1,leftover1] = LetterGrade(grade1); %1st row
[gradeLetter2,leftover2] = LetterGrade(grade2); %2nd row
[gradeLetter3,leftover3] = LetterGrade(grade3); %3rd row
[gradeLetter4,leftover4] = LetterGrade(grade4); %4th row

%Create,open,write to, and close a csv file with the new data
fid=fopen('NewClassData.csv','w+'); %create, and open a file to write to
fprintf(fid,'JoinedName, LetterGrade\n'); %Create column names
fprintf(fid,[name1,',',gradeLetter1,'\n']); %row 1
fprintf(fid,[name2,',',gradeLetter2,'\n']); %row 2
fprintf(fid,[name3,',',gradeLetter3,'\n']); %row 3
fprintf(fid,[name4,',',gradeLetter4,'\n']); %row 4
fclose(fid); %close the file


