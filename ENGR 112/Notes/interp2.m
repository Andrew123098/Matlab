
clc
clear
close all


x=[0,1,2,3,4];
y=[0,2,4,7,4];
yi=2.5;
plot(x,y,'.r','Markersize',15)
interp=interp1(x,y,yi,'spline'); 


x=linspace(0.1,1,7);
y=linspace(1.1,3,10);
[X,Y]=meshgrid(x,y); 

