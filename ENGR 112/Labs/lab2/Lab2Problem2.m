%Andrew Brown Lab 2 Problem 2

clc
clear
clf

%I am practicing using linspace with mathmatical calculations and plotting.

%Define variable x as many values between 0.1 and 13 to have a smooth graph
x=linspace(0.1,13,200); %Units are radians

%Practice with mathmatical equations.
y=((sqrt(2*x).*(4*x.^3)))./((4*x)+(7.^(x/10)));
z=log10((2*x)+5)+(((4*x)+exp(x))./((2/3)+(4*x.^2)));

%Practice using a for loop to print different array values.
for i=1:3 %Runs with integer values of i from 1 to 3.
    fprintf('For x = %0.6f radians, y is %0.6f, and z is %0.6f.\n', x(i), y(i), z(i))
end 

%Plottng X vs. Y and X vs. Z
plot(x,y,'b') %Plots x vs y and make the line blue
hold on %Keep the current figure visible
plot(x,z,'g')%plot x vs z and make the line green
legend('X vs. Y', 'X vs. Z') %add a legend
axis([0.1,15,0,1000]) %Define the axis limits
title('X vs. Y and X vs. Z (self check)') %titles the plot



