% Andrew Brown: Homework 1 Problem 3

clc
clear

%Mathmatical equations with earthquakes.

%Define variables.
E0=10^(4.4); %units in joules

%Input functions for the 2 earthquakes.
M1=input('The magnitude of the first earthquake:');
M2=input('The magnitude of the second earthquake:');

%These are the equations for the energy of the earthquakes using thr above inputs.
E1=(10^((3*M1)/2))*E0; %Units in Joules
E2=(10^((3*M2)/2))*E0; %Units in Joules

%Difference between the energy of the 2 earthquakes.
E=abs(E1-E2);

%Print out the results.
fprintf('The magnitude of the first earthquake was %0.6f and released %0.6e Joules of energy.\n', M1, E1)
fprintf('The magnitude of the second earthquake was %0.6f and released %0.6e Joules of energy.\n', M2, E2)
fprintf('The energy difference between the two earthquakes is %0.6e Joules.\n', E)


