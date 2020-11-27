%Andrew Brown Homework 5 Problem 1

clc
clear

%More practice functions and fzero.
%Projectile motion simulated

%Define constants
g=9.8; %acceleration due to gravity in m/s^2
theta=89; %launch angle in degrees
v=13.5; %initial velocity in m/s

%Declare given position functions
x = @(t) [v.*t.*cosd(theta)]; %x distance traveled
y = @(t) [v.*t.*sind(theta)-(1/2).*g.*t.^(2)]; %y distance traveled

%Plot and calculate time and location when the ball hits the ground
yZero=fzero(y,9.3); %find the time, t when the cannon ball hits the ground
xPos=x(yZero); %find the distance from the cannon the ball hits the ground

%Print out calculated values
fprintf('It lands really, really close to the cannon (%0.4f m) after %0.4f seconds\n',xPos,yZero) %Print out calculated values