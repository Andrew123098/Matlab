%% Create and plot a 3D spiral
% An example of a function that has one parameter (where you are on the
% spiral) and three outputs, the (x,y,z) positions

% Clear everything
clear
clc
clf

% Create 1000 t values in the range 0 to 4 pi (two times around the circle)
t = linspace( 0, 4 * pi, 1000);

% Generate points on the spiral
% x,y,z will be vectors of length 1000
[x, y, z] = spiral3D(t);

% Plot them in 3D
% Plot3 is just like plot, except it takes x,y,z points (instead of just
% x,y points).
plot3( x, y, z, 'k');
grid on

title('3D spiral');


