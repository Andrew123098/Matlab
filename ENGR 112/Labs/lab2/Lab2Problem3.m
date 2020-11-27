%Andrew Brown Lab 2 Problem 3

clc
clear

%I am practicing editing arrays.

%Defining x as a given array that is out of order.
x=[10, 13, 12, 14];

%Print and display the original array.
fprintf('Original\n\n')
disp(x)


i=x(2); %Use a temporary variable to hold the second value of the array.
x(2)=x(3);
x(3)=i; %Swap the second and third array values.

%Print and display the new array.
fprintf('Swapped\n\n')
disp(x)


%REPEAT!!


%Defining x as a given array that is out of order.
x=[8, 10, 9, 11, 12];

%Print and display the original array.
fprintf('Original\n\n')
disp(x)


i=x(2); %Use a temporary variable to hold the second value of the array.
x(2)=x(3);
x(3)=i; %Swap the second and third array values.

%Print and display the new array.
fprintf('Swapped\n\n')
disp(x)



