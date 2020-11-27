%Andrew Brown Homework 5 Problem 2

clc
clear

%Find all the intersections of two functions in a given domain

%Anonymous functions of the given equations
F1=@(x) [100.*exp(-x)-1]; %function of the first given equation
F2=@(x) [sin(pi.*x)]; %function of the second given equation

%Plot the two functions
hold on
fplot(F1) %plot exp
fplot(F2) %plot sin
axis([2,10,-2,14]) %define axes

%Anonymous function that will equal zero where F1 and F2 intersect
FInt=@(x) [F1(x)-F2(x)]; %when == 0, F1=F2

%Calculate intersections
interval=2:0.1:10; %define common interval
FStore=ones(length(interval),1); %preallocate fStore
for j=1:length(interval) %count up by one for the length of the times I calculate fzero
    i=interval(j); %to calculate fzero many times
    FZero=fzero(FInt,i); %calculate fzero
    FStore(j)=FZero; %store values of fzero
    xInt=uniquetol(FStore,0.00001); %calculate x values of unique intrsections
end

%Plot the points of intersection on the graph
yInt=ones(length(xInt)); %preallocate yVals
for k=1:length(xInt) %loop through the number of unique values found
    yInt(k)=F2(xInt(k)); %calculate Y values of unique intersections
    plot(xInt(k),yInt(k),'xk') %plot the x vs y values of the unique intersections
end
%Plotting stuff
title('Intersection of Two Functions') %title the plot
xlabel('x') %x label of the plot
ylabel('y') %y label of the plot
legend('F1: Exp', 'F2: sin') %legend of the plot

%Print out the x values of the unique intersections
fprintf('The equations intersect at the following x values:\n')
disp(xInt)
