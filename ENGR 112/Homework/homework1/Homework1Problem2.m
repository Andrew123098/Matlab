% Andrew Brown: Homework 1 Problem 2

clc
clear

%Mathmatical calculations for projectile physics.

%a.)Given an initial velocity of 3.5 meters per second and an angle of 48 
%degrees above the ground, alculate the (x,y) location of the projectile 
%at both time 0.45 seconds and 0.7 seconds.

%Define variables

v=3.5; %units in meters per second
theta=48; %units in degrees
g=9.8; %force of gravity in meters per second squared
t=input('Value for t in seconds:'); %user input for time in seconds.

%Calculations
xt=v*t*cosd(theta);
yt=(v*t*sind(theta))-((1/2)*g*t^2);

fprintf('At time %0.4f seconds, the (x,y) location of the projectile is (%0.4f m, %0.4f m).\n', t, xt, yt)

%b.)Find the t value (within 0.1 m) where the projectile hits the ground,
%assuming it was launched from ground height.

%Set yt=0 and solve for t to find the time when the projectile hits the
%ground. (Wolfram Alpha used for the simplification).
ytground=(2*v*sind(theta))/g;

%Print out the time when the projectile hits the gorund.
fprintf('The projectile hits the ground at %0.4f seconds.\n', ytground)
