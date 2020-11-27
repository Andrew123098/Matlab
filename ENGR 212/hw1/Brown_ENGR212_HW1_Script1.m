% Andrew Brown ENGR 212 HW 1 Problem 5
clc
clear
close all
%Graph two lines of data
x0 = 0; %m
y0 = 0; %m
ax = 0; %m/s^2
v0 = 48; %m/s
theta = 60; %degrees
k = 0.1; %1/s
g = 9.81; %m/s^2
t = linspace(0,8.8,1000); %time values in seconds

%Make functions to find the x and y values
xt = @(g,k,v0,theta,t) ((v0*cosd(theta))/(k)).*(1-exp(-k.*t)); %function to find the x values
yt = @(g,k,v0,theta,t) ((g+k*v0)/k^2).*(1-exp(-k.*t)) - g.*t./k;%(((-exp(-k.*t)).*(g+(k*v0*sind(theta)))-(g.*k.*t)+g+(k*v0*sind(theta))))./(k^2); %function to find the y values

%Make functions for no air resistance
xtnoa = @(v0,t,theta) v0*cosd(theta)*t;
ytnoa = @(v0,g,t,theta) (v0*sind(theta)*t)-(((0.5)*g)*t.^(2));

%save the x and y values to variables
xVals=xt(g,k,v0,theta,t);
yVals=yt(g,k,v0,theta,t);
xValsNoA=xtnoa(v0,t,theta);
yValsNoA=ytnoa(v0,g,t,theta);

%plot the x vs the y values of position to get the particle motion curve
plot(xVals,yVals,'Linewidth',1);
hold on
plot(xValsNoA,yValsNoA,'Linewidth',1)
title('Projectile Motion');
xlabel('X Position (m)');
ylabel('Y Position (m)');
legend('Projectile Position','No Acceleration');
axis([0,210,0,100]);
