%Andrew Brown Lab 6 Problem 3

clc
clear
close all
hold on

%Practice with text files,interpolation, fit plotting, and trapz

Data=dlmread('Lab6Data.txt'); %read the text file
[x, sortedIndices]=sort(Data(1,:)); %define x values
y=Data(2,sortedIndices); %define y values
plot(x,y, '.k') %plot the data
dataArea=trapz(x,y); %calculate the area under the original data
plot(x,y,'k') %plot the data line
fprintf('Area Original Data: %0.6f\n',dataArea) %print out the original data integral

%plot the fit lines and calculate the area under the fit lines
for i=2:4
    P=polyfit(x,y,i); %Create a polynomial of 2nd order to fit the data to a function
    polyFunc= @(x) polyval(P,x); %anonymous function so I can call polyval
    polyArea=integral(polyFunc,x(1),x(end)); %calculate the area under the caluclated fit lines
    fprintf('Area poly deg %0.0f fitted: %0.6f\n',i,polyArea) %print out the degrees and areas
end