% Andrew Brown Lab 10 Script 1

clc
clear
close all

%Practice plotting surfces

%Create t-values
t=linspace(0,3*pi,40);

%Create fucntion to plot
myFunc = @(t) abs(2*sin(t)+cos(t));

%pass t values through the function
ys=myFunc(t);

%plot the fucntion
fplot(myFunc)

%get the vales into cylidrical coordinates
[x,y,z]=cylinder(ys);

%plot the suface with cylindrical coordinates
surf(x,y,z,'FaceColor','m','EdgeColor','none') 
camlight left %lighing from the left side
lighting flat
% alpha(0.6);

