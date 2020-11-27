% Andrew Brown Homework 2 Problem 6

clc
clear

% Epidemic Part 1

%Part 1.1

%Initial Values
a=10; %the contact rate: the average # of people a person comes in contact with.
b=1.25; %the amount of time in days that a person is infectious
S0=0:500:2000; %Susceptibles, those who have never had the illness and can catch it.
I0=100; %Infectives, those who are infected and are contagious.
R0=0; % Recovered, those who already had the illness and are immune.
h=0.05; %timestep in days

%Print out parameters.
fprintf('Parameters: avg contacted, %0.0f, number of days infectious, %0.2f\n', a, b)

%Print out starting S values.
fprintf('Starting S values:\n   %0.0f   %0.0f   %0.0f   %0.0f   %0.0f\n\n',S0(1),S0(2),S0(3),S0(4),S0(5))

%Part 1.1

%Equations used for calculations of the first timestep.
N=S0+I0+R0; %Total population
dS=(-a.*S0.*I0)./N; %How S changes
dI=((a.*S0.*I0)./N)-(I0./b); %How I changes
dR=I0./b; %How R changes

%Calculations for values over time using the first timestep.
S1=S0+(h.*dS); %# of S after time h.
I1=I0+(h.*dI); %# of I after time h.
R1=R0+(h.*dR); %# of R after time h.

%Equations used for calculations of the second timestep.
dS=(-a.*S1.*I1)./N; %How S changes
dI=((a.*S1.*I1)./N)-(I1./b); %How I changes
dR=I1./b; %How R changes

%Calculations for values over time using the second timestep.
S2=S1+(h.*dS); %# of S after time h.
I2=I1+(h.*dI); %# of I after time h.
R2=R1+(h.*dR); %# of R after time h.

%Print out ending values after 2 timesteps
fprintf('Ending S values:\n')
disp(S2)
fprintf('Ending I values:\n')
disp(I2)
fprintf('Ending R values:\n')
disp(R2)
fprintf('Totals (S + I + R):\n')
disp(N)
