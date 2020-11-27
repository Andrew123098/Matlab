% Andrew Brown Homework 2 Problem 2

clc
clear
clf

%Practice using the subplot and polar coordinate operators to make polar
%roses.

%Define given variables.
n=5:7;
d=[1, 7, 5];
theta1=linspace(0,pi,200);
theta2=linspace(0,8*pi,200);
theta3=linspace(0,12*pi,500);
t1=linspace(0,pi,200);
t2=linspace(0,8*pi,200);
t3=linspace(0,12*pi,500);

%Express given equations.
x1=cos((n(1)/d(1)).*t1).*cos(t1); %Cartesian coodinates
y1=cos((n(1)/d(1)).*t1).*sin(t1); %Cartesian coodinates
r1=cos((n(1)/d(1)).*theta1); %Polar coodinates

%Create a 2x3 subplot and plot in polar coodinates in spot 1.
subplot(2,3,1)
polarplot(theta1,r1,'b')
title('Polar Rose for n=5 and d=1')

%Plot in cartesian coodinates in subplot spot 4.
subplot(2,3,4)
plot(x1,y1,'b')
title('Polar Rose on Cartesian Coordinates for n=5 and d=1')

%Express given equations again for second t and theta values.
x2=cos((n(2)/d(2)).*t2).*cos(t2); %Cartesian coodinates
y2=cos((n(2)/d(2)).*t2).*sin(t2); %Cartesian coodinates
r2=cos((n(2)/d(2)).*theta2); %Polar coodinates

%Plot in polar coodinates in subplot spot 2.
subplot(2,3,2)
polarplot(theta2,r2,'b')
title('Polar Rose for n=6 and d=7')

%Plot in cartesian coodinates in subplot spot 5.
subplot(2,3,5)
plot(x2,y2,'b')
title('Polar Rose on Cartesian Coordinates for n=6 and d=7')

%Express given equations again for third t and theta values.
x3=cos((n(3)/d(3)).*t3).*cos(t3); %Cartesian coodinates
y3=cos((n(3)/d(3)).*t3).*sin(t3); %Cartesian coodinates
r3=cos((n(3)/d(3)).*theta3); %Polar coodinates

%Plot in polar coodinates in subplot spot 3.
subplot(2,3,3)
polarplot(theta3,r3,'b')
title('Polar Rose for n=7 and d=5')

%Plot in cartesian coodinates in subplot spot 6.
subplot(2,3,6)
plot(x3,y3,'b')
title('Polar Rose on Cartesian Coordinates for n=7 and d=5')
