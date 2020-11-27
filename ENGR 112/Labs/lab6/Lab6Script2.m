%Andrew Brown Lab 6 Problem 2

clc
clear
close all

%Practice with text files,fit plotting, and interpolation

%Read the data from the text file
Data=dlmread('Lab6Data.txt'); %read the text file
x=Data(1,:); %define x values
y=Data(2,:); %define y values

%Plot the 3 different interpolatd graphs against the data
i=[5,10,15]; %different number of samples
color={'r','b','g'}; %different color for each plot
tag={'nSamples=5','nSamples=10','nSamples=15'}; %loop of legend tags
for a=1:3
    subplot(1,3,a) %create 3 different plots
    plot(x,y, '.') %plot the data[
    hold on
    newX=linspace(x(1),x(end),i(a)); %interpolated values of x on the same interval
    P=polyfit(x,y,2); %Create a polynomial of 2nd order to fit the data to a function
    polyFunc=interp1(x,y,newX,'spline'); %anonymous function so I can call polyval
    plot(newX,polyFunc,color{a}) %plot the fit polynomial
    xlabel('x') %label x axis
    ylabel('y') %label y axis
    axis([0,10,-6,12])
    title('Interp') %title the plot
    legend('Data',tag{a}) %add legend
end
