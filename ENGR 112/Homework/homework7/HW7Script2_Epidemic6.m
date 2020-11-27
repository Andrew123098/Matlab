%Andrew Brown Homework 7 Problem 2

clc
clear
close all

%Epidemic Part 6 [Conditions to start an epidemic]

%Initial Values
a=10; %the contact rate: the average # of people a person comes in contact with.
b=1.25; %the amount of time in days that a person is infectious
S0=linspace(0,2000,2000); %Susceptibles, those who have never had the illness and can catch it.
I0=100; %Infectives, those who are infected and are contagious.
R0=0; % Recovered, those who already had the illness and are immune.
h=0.05; %timestep in days
nSteps=1:140; %timesteps

[S,I,R,N] = DisSimulate(nSteps);

% [bIsEpidemic,peakIValue,peakTime]=IsEpidemic(S0,I0,a,b,nSteps,h);

[mSign,m] = FindEpidemic(I,S0,h); %find the slope of the infected plot

%fit the data and find where it equals 0
P=polyfit(S0,m,20); %convert the data to a polynomial
polyFunc=@(m) polyval(P,m); %solve for the needed values of the new polynomial P
zero=round(fzero(polyFunc,10)); %Find where the polynomial equals 0
fprintf('Smallest starting population that results in an epidemic: %0.0f\n',zero) %Print zero

%Plot the data and where the data equals zero
hold on
plot(S0,m) %plot the starting non-sick pop vs the slope of the infected
plot(zero,m(zero),'xk','Markersize',10); %plot the zero value on the same graph
axis([0,2000,-100,900]) %define the axes
xlabel('Starting non-sick population') %x label
ylabel('Slope of number of infected') %y label
title('Slope of infection versus starting population') %title of plot