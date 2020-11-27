%Lab 1 Andrew Brown

clc
clear

%I am practicing using arrays, calculating sines and cosines, and ploting.

%Practice making an array calculation and establishing variables.
ts=linspace(0, 2*pi, 30);
xs=cos(ts);
ys=sin(ts);

%Practice plotting on one graph and changing plot colors.
plot(ts, xs, '-r')
hold on %adds previous plot to next plot
plot(ts, ys, '-g')

clf %Clear current figure
plot(xs, ys)
axis equal %makes the x and y axis equal to e/o.
