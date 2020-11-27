%Andrew Brown Lab 6 Problem 1

clc
clear
close all
hold on

%Practice with text files, and fit plotting

Data=dlmread('Lab6Data.txt'); %read the text file
x=Data(1,:); %define x values
y=Data(2,:); %define y values
plot(x,y, '.') %plot the data
for i=2:4
P=polyfit(x,y,i); %Create a polynomial of 2nd order to fit the data to a function
polyFunc= @(x) polyval(P,x); %anonymous function so I can call polyval
fplot(polyFunc,[0,12]) %plot the fit polynomial
xlabel('x') %label x axis
ylabel('y') %label y axis
title('Fit') %title the plot
end
legend('Data','Deg=2','Deg=3','Deg=4') %give a legend