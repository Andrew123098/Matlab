function [ xs, ys ] = spiral( ts )
%% Make a spiral in the plane
% Two outputs: x and y vectors

% radius grows as square root 
xs = sqrt(ts) .* cos(2 * ts); % Set x
ys = sqrt(ts) .* sin(2 * ts); % Set y

end

