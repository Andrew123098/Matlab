function [ xs, ys, zs ] = spiral3D( ts )
%% Make a 3D version of the spiral
%  Z increases linearly with t
% All three outputs will be vectors the same length as ts

% Set the x, y, and z values for the spiral
% x and y scale with the square root of t
xs = sqrt(ts) .* cos(2 * ts);
ys = sqrt(ts) .* sin(2 * ts);

% z increases linearly with t
zs = 0.5 * ts;

end

