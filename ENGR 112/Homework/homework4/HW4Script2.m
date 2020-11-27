% Andrew Brown Homework 4 Problem 2

clc
clear
clf

%Practice using the subplot and polar coordinate operators to make polar
%roses.

%Define given variables that change number of petals in the roses
n=5:7;
d=[1,7,5];

%Call the roses function that creates 3 polar roses and 3 cartesian roses
[x,y,r,interval,theta,t] = Roses(n,d);

%Plot all of the polar and cartesian roses using their output variables
for j=1:length(n)
    subplot(2,length(n),j) %plot the polar plots in the top row
    polarplot(theta(j,:),r(j,:),'b') %plot all 3 polar plots
    t1=strcat('Polar Rose for n=', num2str(n(j)), 'and d=',num2str(d(j))); %Concatanate strings for the title and turn numbers into strings
    title(t1) %title all 3 polar plots
    subplot(2,length(n),j+length(n)) %plot the cartesian plots in the bottom row
    plot(x(j,:),y(j,:),'b') %plots all 3 cartesian plots
    t2=strcat('Polar Rose on Cartesian Coordinates for n=',num2str(n(j)),'and d=',num2str(d(j)));%Concatanate strings for the title and turn numbers into strings
    title(t2) %title all 3 cartesian plots
end
