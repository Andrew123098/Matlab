% Andrew Brown Homework 1 Problem 6

clc
clear

% Euler Leaf Part 1

%Initial Conditions
x0=5.3; %position in meters
v0=-0.5; %velocity in meters/second
m=5.2; %mass in kilograms
h=input('Timestep:'); %time in seconds


%Part A: Find the new position and velocity after taking one timestep.


%Force Function (in Newtons)
Fxv=3*cos(6*x0)*x0-(0.9*v0);

%Update Position equations
a=Fxv/m;
x1=x0+h*v0;
v1=v0+h*a;

%Print out old position, new position and timestep.
fprintf('Part A)\nOld position: %0.4f meters, new position %0.4f meters, time step %0.4f\n', x0, x1, h)
fprintf('Old velocity: %0.4f m/s, new velocity %0.4f m/s, time step %0.4f\n', v0, v1, h)


%Part B: The position and velocity after taking another step starting with
%the values calculated in Part A.

%New input for time.
h=input('Timestep:');

%Force Function (in Newtons)version 2.0
Fxv2=3*cos(6*x1)*x1-(0.9*v1);

%Update Position equations version 2.0
a2=Fxv2/m;
x2=x1+h*v1;
v2=v1+h*a2;

%Print out old position, new position and timestep version 2.0
fprintf('Part B)\nOld position: %0.4f meters, new position %0.4f meters, time step %0.4f\n', x1, x2, h)
fprintf('Old velocity: %0.4f m/s, new velocity %0.4f m/s, time step %0.4f\n', v1, v2, h)

clear

%Part C: Calculate the new position and velocity after taking one timestep
%with h=0.02.

%Initial Conditions Version 2.0
x0=5.3; %position in meters
v0=-0.5; %velocity in meters/second
m=5.2; %mass in kilograms
h=input('Timestep:'); %time in seconds

%Force Function (in Newtons)again.
Fxv=3*cos(6*x0)*x0-(0.9*v0);

%Update Position equations again.
a=Fxv/m;
x1=x0+h*v0;
v1=v0+h*a;

%Print out old position, new position and timestep again.
fprintf('Part C)\nOld position: %0.4f meters, new position %0.4f meters, time step %0.4f\n', x0, x1, h)
fprintf('Old velocity: %0.4f m/s, new velocity %0.4f m/s, time step %0.4f\n', v0, v1, h)


