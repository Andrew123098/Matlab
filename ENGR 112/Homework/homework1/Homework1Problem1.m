% Andrew Brown: Homework 1 Problem 1

clc
clear

%Practice declaring variables and preforming mathmatical computations.

%Define variables
x=45;

%Define variables as functions of x.
y=((5*x^3)*sqrt(2*x^(2)))/(cosd(x+5));
t=1/sin(1/x);
z=(2*exp(x/380))+(x*log(x^(2)/3));

%Print out x, y, t, and z in the command window.
fprintf('When x is %0.5f,\ny is %0.5f,\nt is %0.5f,\nand z is %0.5f.\n', x, y, t, z)