% Andrew Brown Homework 5 Problem 3

clc
clear
close all

% Epidemic Part 5: Practicing plotting with fzero and functions while
% finding the maximum number of people ifected in an epidemic

%Initial Values
a=10; %the contact rate: the average # of people a person comes in contact with.
b=1.25; %the amount of time in days that a person is infectious
S0=0:500:2000; %Susceptibles, those who have never had the illness and can catch it.
I0=100; %Infectives, those who are infected and are contagious.
R0=0; % Recovered, those who already had the illness and are immune.
h=0.05; %timestep in days
nSteps=1:140; %timesteps

[S,I,R,N] = DisSimulate(nSteps);

[bIsEpidemic,peakIValue,peakTime]=IsEpidemic(S0,I0,a,b,nSteps,h);

%Print out ending values after 140 timesteps
for j=1:length(S0)
    fprintf('Start S=%0.0f, Ending: S = %0.0f, I = %0.0f, R = %0.0f, total %0.0f\n', S(1,j),S(length(nSteps),j),I(length(nSteps),j),R(length(nSteps),j),N(1,j))
    if bIsEpidemic(j)==1
        fprintf(' Is Epidemic, time %0.2f days number of people %0.0f\n',peakTime(j),peakIValue(j))
    end
end

%Plot S, I, R, and Totals vs time
titleName = {'Susceptibles', 'Infected', 'Recovered', 'Total'};
plotColor = {'r', 'g', 'b', 'k', 'c'};
legendVar = {'Start S = 0','Start S = 500','Start S = 1000','Start S = 1500','Start S = 2000'}; %add a legend
for k=1:length(S0)
    %Plot S vs Time
    hold on %keep all on same plot
    subplot(1,4,1) %plot in first position
    plot(nSteps.*h,S(:, k),plotColor{k},'Linewidth',3) %plot s vs time
    title(strcat(titleName{1}, ' versus time') )%title the plot
    xlabel('Time (Days)') %X label for the plot
    ylabel('Number of People') %Y label for the plot
    axis([0,7,0,2200]) %Set proper axes
    if k==5
        legend('Start S = 0','Start S = 500','Start S = 1000','Start S = 1500','Start S = 2000') %add a legend
    end
    
    %Plot I vs Time
    hold on %keep all on same plot
    subplot(1,4,2) %plot in second position
    plot(nSteps.*h,I(:, k),plotColor{k},'Linewidth',3) %plot I vs time
    if bIsEpidemic(k)==1 %if there is an epidemic occuring
        plot(peakTime(k),peakIValue(k),'xk','Markersize',15) %plot the maximum number of infected and the time
    end
    title(strcat(titleName{2}, ' versus time') )%title the plot
    xlabel('Time (Days)') %X label for the plot
    ylabel('Number of People') %Y label for the plot
    axis([0,7,0,2200]) %Set proper axes
    
    %Plot R vs Time
    hold on %keep all on same plot
    subplot(1,4,3) %plot in third position
    plot(nSteps.*h,R(:, k),plotColor{k},'Linewidth',3) %plot R vs time
    title(strcat(titleName{3}, ' versus time') )%title the plot
    xlabel('Time (Days)') %X label for the plot
    ylabel('Number of People') %Y label for the plot
    axis([0,7,0,2200]) %Set proper axes
    
    %Plot Total vs Time
    hold on %keep all on same plot
    subplot(1,4,4) %plot in fourth position
    plot((1:length(N))*h,N(:,k),plotColor{k},'Linewidth',3) %plot total vs time
    title(strcat(titleName{4}, ' versus time') )%title the plot
    xlabel('Time (Days)') %X label for the plot
    ylabel('Number of People') %Y label for the plot
    axis([0,7,0,2200]) %Set proper axes
end

