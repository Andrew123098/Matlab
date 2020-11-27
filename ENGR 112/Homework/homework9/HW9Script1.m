%Andrew Brown Homework 9 Problem 1

clc
clear

%Compute the total mass (g) of the rocket compononets shown in the given
%table using a dot product.

%Given vlues from the table
density=[0.7,6.8,2.9,4.5]; %g/cm^3
volume=[700,150,300,50]; %cm^3

%Take the dot product of the 2 matrices made and print the result
dotProduct=dot(density,volume);
fprintf('Total Mass of Rocket Parts: %0.2f g\n',dotProduct)