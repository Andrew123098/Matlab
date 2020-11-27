%Lab 1 Andrew Brown

clc
clear

%I am practicing simple mathmatical calculations and functions.

%Practice defining variables using mathmatical functions and syntax.
x=0.1; %Units are radians
y=((sqrt(2*x)*(4*x^3)))/((4*x)+(7^(x/10)));
z=log10((2*x)+5)+(((4*x)+exp(x))/((2/3)+(4*x^2)));

%Practice using the "fprintf" function.
fprintf('For x = %0.6f radians, y is %0.6f, and z is %0.6f.\n', x, y, z)