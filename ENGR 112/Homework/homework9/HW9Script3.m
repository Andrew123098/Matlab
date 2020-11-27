%Andrew Brown Homework 9 Problem 3

clc
clear
close all

%Model an elliptical staircase in different ways

%h=4 n=2 elipse
%define variables
t=linspace(-400,400,10000); %independent variable
a=8; %m
b=4; %m
h=4; %m
n=2; %m

[x,y,z] = Staircase(a,b,h,n,t); %Make the staircase
subplot(2,3,1) %place in subplot
plot3(x,y,z) %plot in 3 dimensions
xlabel('x(m)') %x label
ylabel('y(m)') %y label
zlabel('z(m)') %z label
title('h=4, n=2') %title

%h=4 n=4 elipse
%define variables
t=linspace(-600,600,10000); %independent variable
a=8; %m
b=4; %m
h=4; %m
n=4; %m

[x,y,z] = Staircase(a,b,h,n,t); %Make the staircase
subplot(2,3,2) %place in subplot
plot3(x,y,z) %plot in 3 dimensions
xlabel('x(m)') %x label
ylabel('y(m)') %y label
zlabel('z(m)') %z label
title('h=4, n=4') %title

%h=4 n=6 elipse
%define variables
t=linspace(-1000,1000,10000); %independent variable
a=8; %m
b=4; %m
h=4; %m
n=6; %m

[x,y,z] = Staircase(a,b,h,n,t); %Make the staircase
subplot(2,3,3) %place in subplot
plot3(x,y,z) %plot in 3 dimensions
xlabel('x(m)') %x label
ylabel('y(m)') %y label
zlabel('z(m)') %z label
title('h=4, n=6') %title

%h=8 n=2 elipse
%define variables
t=linspace(-400,400,10000); %independent variable
a=8; %m
b=4; %m
h=8; %m
n=2; %m

[x,y,z] = Staircase(a,b,h,n,t); %Make the staircase
subplot(2,3,4) %place in subplot
plot3(x,y,z) %plot in 3 dimensions
xlabel('x(m)') %x label
ylabel('y(m)') %y label
zlabel('z(m)') %z label
title('h=8, n=2') %title

%h=8 n=4 elipse
%define variables
t=linspace(-600,600,10000); %independent variable
a=8; %m
b=4; %m
h=8; %m
n=4; %m

[x,y,z] = Staircase(a,b,h,n,t); %Make the staircase
subplot(2,3,5) %place in subplot
plot3(x,y,z) %plot in 3 dimensions
xlabel('x(m)') %x label
ylabel('y(m)') %y label
zlabel('z(m)') %z label
title('h=8, n=4') %title

%h=8 n=6 elipse
%define variables
t=linspace(-1000,1000,10000); %independent variable
a=8; %m
b=4; %m
h=8; %m
n=6; %m

[x,y,z] = Staircase(a,b,h,n,t); %Make the staircase
subplot(2,3,6) %place in subplot
plot3(x,y,z) %plot in 3 dimensions
xlabel('x(m)') %x label
ylabel('y(m)') %y label
zlabel('z(m)') %z label
title('h=8, n=6') %title
