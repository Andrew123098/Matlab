% Andrew Brown Lab 3 Problem 1

clc
clear

%Practice with for loops and if statements

totalSum=0;
%For loop counting from 1 to 10 going up
for i=1:10
    if i==1 %use proper grammar for the first bottle
        fprintf('%0.0f bottle of beer on the wall\n',i)
    else %use proper grammar for the plural "bottles"
        fprintf('%0.0f bottles of beer on the wall\n',i)
    end %end if statement
    totalSum=totalSum+i;%add current bottles to toalSum
end %end for loop

%print out the total number of bottles from the totalSum variable
fprintf('Total number of bottles is: %0.0f\n',totalSum)

%Reset the variable totalSum to 0
totalSum=0;

%For loop conting from 10 to 1 going down
for k=10:-1:0
    if k==1 %use proper grammar for the first bottle
        fprintf('%0.0f bottle of beer on the wall\n',k)
    else %use proper grammar for the plural "bottles"
        fprintf('%0.0f bottles of beer on the wall\n',k)
    end %end if statement
    totalSum=totalSum+k; %add current bottles to toalSum
end %end for loop

%print out the total number of bottles from the totalSum variable
fprintf('Total number of bottles is: %0.0f\n',totalSum)