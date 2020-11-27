% Andrew Brown Homework 3 Problem 4

clc
clear
close all

% Epidemic Part 3: more practicing with if and for loops. In particular, I
% practiced with matrixes in this code.

%Initial Values
a=10; %the contact rate: the average # of people a person comes in contact with.
b=1.25; %the amount of time in days that a person is infectious
S0=0:500:2000; %Susceptibles, those who have never had the illness and can catch it.
I0=100; %Infectives, those who are infected and are contagious.
R0=0; % Recovered, those who already had the illness and are immune.
h=0.05; %timestep in days
ts=1:140; %timesteps

%Preallocate all necessary matrices
dS=zeros(length(ts)-1,length(S0)); %Preallocate dS
dI=dS; %Preallocate dI
dR=dS; %Preallocate dR
S=zeros(length(ts),length(S0)); %Preallocate S
I=S; %Preallocate I
R=S; %Preallocate R

%Set first rows to the given values S0 and I0
S(1, :)=S0; %Set first row of S to the S0 array
I(1, :)=I0; %Set the first row of R to all equal the constant R0

%Run all 140 timesteps with a for loop with the given equations
for i=1:(length(ts)-1)
    %Equations used for cjjalculations of the first timestep.
    N=S0+I0+R0; %Total population
    dS(i, :)=(-a.*S(i, :).*I(i, :))./N; %How S changes
    dI(i, :)=((a.*S(i, :).*I(i, :))./N)-(I(i, :)./b); %How I changes
    dR(i, :)=I(i, :)./b; %How R changes
    
    %Calculations for values over time using the previous timestep.
    S(i+1, :)=S(i, :)+(h.*dS(i, :)); %# of Sick people after time h.
    I(i+1, :)=I(i, :)+(h.*dI(i, :)); %# of Infected people after time h.
    R(i+1, :)=R(i, :)+(h.*dR(i, :)); %# of Recovered people after time h.
end

%Print out ending values after 140 timesteps
for j=1:length(S0)
    fprintf('Start S=%0.0f, Ending after %0.2f Days: S = %0.0f, I = %0.0f, R = %0.0f, total %0.0f\n', S(j),h*length(ts),S(length(ts),j),I(length(ts),j),R(length(ts),j),N(j))
end

%Plot S, I, R, and Totals vs time
for k=1:length(S0)
    %Plot S vs Time
    hold on %keep all on same plot
    subplot(1,4,1) %plot in first position
    plot(ts,S(:, k),'xk') %plot s vs time
    title('Susceptibles vs. Time') %title the plot
    xlabel('Time') %X label for the plot
    ylabel('Number of People') %Y label for the plot
    axis([0,140,0,2200]) %Set proper axes
    
    %Plot I vs Time
    hold on %keep all on same plot
    subplot(1,4,2) %plot in second position
    plot(ts,I(:, k),'xk') %plot I vs time
    title('Infected vs. Time') %title the plot
    xlabel('Time') %X label for the plot
    ylabel('Number of People') %Y label for the plot
    axis([0,140,0,2200]) %Set proper axes
    
    %Plot R vs Time
    hold on %keep all on same plot
    subplot(1,4,3) %plot in third position
    plot(ts,R(:, k),'xk') %plot R vs time
    title('Recovered vs. Time') %title the plot
    xlabel('Time') %X label for the plot
    ylabel('Number of People') %Y label for the plot
    axis([0,140,0,2200]) %Set proper axes
    
    %Plot Total vs Time
    hold on %keep all on same plot
    subplot(1,4,4) %plot in fourth position
    plot(ts,N(k),'xk') %plot total vs time
    title('Total vs. Time') %title the plot
    xlabel('Time') %X label for the plot
    ylabel('Number of People') %Y label for the plot
    axis([0,140,0,2200]) %Set proper axes
end
