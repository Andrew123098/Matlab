%Andrew Brown Homework 6 Probelm 2

clc
clear

%Data linearization with a simulated data set

%Generate measurments over time of a radium sample
A0=20; %mg of radium
r=-0.000436; %decay rate
t=linspace(0,4000,20); %time in years
A=@(t) A0.*exp(r*t); %amount of mass of radium in mg as a function of time
data_A=A(t); %find 20 evenly spaced measurments of A from 0 to 4000 years

%adds random noise with error of up to +- 5% to the data
addSampleNoise=(rand(size(t))-0.5.*(data_A.*0.1));
A_noisy=data_A+addSampleNoise;

%print the first and last values of A_noisy
fprintf('First noisy sample: %0.4f mg at t = 0 years\nLast noisy sample: %0.4f mg at t = 4000 years\n',A_noisy(1),A_noisy(end))

%Plot 4 differt transformations of the data

%Plot linear plot
subplot(2,4,1) %plot in first position
plot(t,A_noisy,'.k','Markersize',12) %Linear
xlabel('Time (years)') % x label
ylabel('Mass (mg)') % y label
title('Mass vs. Time Linear-Linear Axes') %title the plot
axis([0,4000,0,25]) %proper axes

%Plot power plot
subplot(2,4,2) %plot in second position
plot(log(t),log(A_noisy),'.k','Markersize',12) %Power
xlabel('ln(Time) (years)') % x label
ylabel('ln(Mass) (mg)') % y label
title('Mass vs. Time Log-Log Axes') %title the plot
axis([4,10,1,3.5]) %proper axes

%Plot Exponential plot
subplot(2,4,5) %plot in 5th position leaving 3 and 4 blank
plot(t,log(A_noisy),'.k','Markersize',12) %Exponential
xlabel('Time (years)') % x label
ylabel('ln(Mass) (mg)') %y label
title('Mass vs. Time Linear-Log Axes') %title the plot
axis([0,4000,1,3.5]) %proper axes

%Plot Logarithmic plot
subplot(2,4,6) %plot in sixth position
plot(log(t),A_noisy,'.k','Markersize',12) %Logarithmic
xlabel('ln(Time) (years)') % x label
ylabel('Mass (mg)') % y label
title('Mass vs. Time Log-Linear Axes') %title the plot
axis([4,10,0,25]) %proper axes

%Plot the linear-log data with its line of best fit as an exponential
subplot('Position',[0.55,0.1,0.4,0.85]) %properly position the new plot
P=polyfit(t,log(A_noisy),1); %get m and b coeffficients
fprintf('Polynomial is y=mt+b with m = %0.6f and b = %0.6f\n',P(1),P(2)) %print out m and b coefficients
polyFunc=@(t) exp(P(2)).*exp(P(1).*t); %find an exponential fnction with the same coeffs
fplot(polyFunc,'k') %plot the fit function
hold on
plot(t,A_noisy,'.k','Markersize',12) %plot the original data on the same plot
xlabel('Time (years)') % x label
ylabel('Mass (mg)') % y label
title('Mass vs. Time Fitted Polynomial') %title of graph
legend('Fitted Function','Data') %make a legend
