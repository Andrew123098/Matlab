%Andrew Brown Homework 6 Problem 4

clc
clear
close all

%Find area of tea spill
widthData=dlmread('TeaSpill.txt'); %read the teaspill width (cm) data
int=0:1.5:1.5*length(widthData)-1; %make 1.5 cm intervals
area=trapz(int,widthData); %calculate area using the correct intervals
fprintf('Area of Tea Spill: %0.3f (cm^2)\n', area) %print out the calcuated area
plot(int,widthData) %plot the width
xlabel('Intervals (cm)') %x label
ylabel('Width (cm)') %y label
title('Width') %title 


