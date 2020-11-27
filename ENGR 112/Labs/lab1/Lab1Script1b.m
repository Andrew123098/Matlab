%Lab 1 Andrew Brown

clc %This command clears the command window
clear %This command clears all variables and functions from the workspace.

%I am practicing defining variables and using the "input" and "fprintf"
%functions.

% Practice defining variables.
t=input('Value for t in degrees:'); %Practice using the "input" function.
x=cosd(t);
y=sind(t);

%Practice using the print function.
fprintf('t is %0.0f deg.\nx is %0.6f. \ny is %0.6f. \n', t, x, y)