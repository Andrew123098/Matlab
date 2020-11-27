%Andrew Brown Lab 10 Script 3

clc
clear
close all

%Practice with Super quadrics

u=linspace(-pi,pi,10); %Define u vals
v=linspace(-pi/2,pi/2,10); %define v vals

[U,V]=meshgrid(u,v); %mate v and u matrices

%Put matrices through function
[x,y,z] = Quadric(U,V);

%Plot the super quadric
surf(x,y,z)
title('Reinacment of Pirates of the Caribean')
camlight right
lighting phong

