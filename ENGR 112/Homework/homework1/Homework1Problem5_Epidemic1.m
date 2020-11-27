% Andrew Brown Homework 1 Problem 5

clc
clear

% Epidemic Part 1

%Part 1.1

%Initial Values
a=10; %the contact rate: the average # of people a person comes in contact with.
b=1.25; %the amount of time in days that a person is infectious
S0=500; %Susceptibles, those who have never had the illness and can catch it.
I0=100; %Infectives, those who are infected and are contagious.
R0=0; % Recovered, those who already had the illness and are immune.
h=0.05; %timestep in days

%Print out parameters.
fprintf('Parameters: avg contacted, %0.0f, number of days infectious, %0.2f\n', a, b)

%Equations used for calculations of the first timestep.
N=S0+I0+R0; %Total population
dS=(-a*S0*I0)/N; %How S changes
dI=((a*S0*I0)/N)-(I0/b); %How I changes
dR=I0/b; %How R changes

%Print out starting S, I, R, and N values.
fprintf('Starting values: S=%0.0f, I=%0.0f, R=%0.0f, total = %0.0f\n', S0, I0, R0, N)

%Calculations for values over time using the first timestep.
S1=S0+(h*dS); %# of S after time h.
I1=I0+(h*dI); %# of I after time h.
R1=R0+(h*dR); %# of R after time h.

%Equations used for calculations of the second timestep.
dS=(-a*S1*I1)/N; %How S changes
dI=((a*S1*I1)/N)-(I1/b); %How I changes
dR=I1/b; %How R changes

%Calculations for values over time using the second timestep.
S2=S1+(h*dS); %# of S after time h.
I2=I1+(h*dI); %# of I after time h.
R2=R1+(h*dR); %# of R after time h.

%Print out ending values after 2 timesteps
fprintf('Ending values: S=%0.2f, I=%0.2f, R=%0.2f, total = %0.2f\n\n', S2, I2, R2, N)

%Part 1.2

%Initial Values
a=10; %the contact rate: the average # of people a person comes in contact with.
b=1.25; %the amount of time in days that a person is infectious
S0=2000; %Susceptibles, those who have never had the illness and can catch it.
I0=100; %Infectives, those who are infected and are contagious.
R0=0; % Recovered, those who already had the illness and are immune.
h=0.05; %timestep in days

%Equations used for calculations of the first timestep.
N=S0+I0+R0; %Total population
dS=(-a*S0*I0)/N; %How S changes
dI=((a*S0*I0)/N)-(I0/b); %How I changes
dR=I0/b; %How R changes

%Print out starting S, I, R, and N values.
fprintf('Starting values: S=%0.0f, I=%0.0f, R=%0.0f, total = %0.0f\n', S0, I0, R0, N)

%Calculations for values over time using the first timestep.
S1=S0+(h*dS); %# of S after time h.
I1=I0+(h*dI); %# of I after time h.
R1=R0+(h*dR); %# of R after time h.

%Equations used for calculations of the second timestep.
dS=(-a*S1*I1)/N; %How S changes
dI=((a*S1*I1)/N)-(I1/b); %How I changes
dR=I1/b; %How R changes

%Calculations for values over time using the second timestep.
S2=S1+(h*dS); %# of S after time h.
I2=I1+(h*dI); %# of I after time h.
R2=R1+(h*dR); %# of R after time h.

%Print out ending values after 2 timesteps
fprintf('Ending values: S=%0.2f, I=%0.2f, R=%0.2f, total = %0.2f\n\n', S2, I2, R2, N)
