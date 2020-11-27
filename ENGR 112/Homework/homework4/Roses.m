function [x,y,r,interval,theta,t] = Roses(n,d)
%ROSES: 
%   Change the number of petals on 6 different polar roses

%Constants to create 6 different kinds of polar roses
interval=500; %plots 500 points so we have a smooth plot
theta=[linspace(0,pi,interval);linspace(0,8*pi,interval);linspace(0,12*pi,interval)]; %define theta values in a matrix
t=[linspace(0,pi,interval);linspace(0,8*pi,interval);linspace(0,12*pi,interval)]; %define t values in a matrix

%Express given equations.
x=zeros(length(t),interval); %Preallocate x matrix
y=zeros(length(t),interval); %Preallocate y matrix
r=zeros(length(theta),interval); %Preallocate z matrix
for i=1:length(n)
    x0=cos((n(i)/d(i)).*t(i,:)).*cos(t(i,:)); %Cartesian coodinates
    y0=cos((n(i)/d(i)).*t(i,:)).*sin(t(i,:)); %Cartesian coodinates
    r0=cos((n(i)/d(i)).*theta(i,:)); %Polar coodinates
    x(i,:)=x0; %Store all 3 x arrays in a matrix
    y(i,:)=y0; %Store all 3 y arrays in a matrix
    r(i,:)=r0; %Store all 3 r arrays in a matrix
end
end

