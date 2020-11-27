%Andrew Brown Homework 2 Problem 1

clc
clear
clf

%Practice plotting arrays with function.

t=-10:0.004:7;
y=(4*t.^3)+(3*t.^2)+(5*t)+5;


plot(t,y,'b')
xlabel('Time (seconds)')
ylabel('Distance (meters)')
title('Self-Check: Time vs. Distance')

fprintf('Minimum occurs at y = %0.3f, maximum occurs at y = %0.3f\n', min(y), max(y))

