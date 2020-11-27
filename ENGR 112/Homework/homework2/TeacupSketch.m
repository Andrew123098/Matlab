%% Simple script to let you draw - and save - a set of points

% After window comes up click four times - you won't see anything, btw
clf;

nPoints = 8;
[xs,ys] = ginput( nPoints );
% Put the first point in at the end so you get a closed picture
% Also center and scale
if ~exist( 'r', 'var' )
    r = 1.5;
end

scale = max( 2*r / ( max(xs) - min(xs) ), 2*r / (max(ys) - min(ys) ) );
xs = scale * ( [xs' xs(1)] - mean(xs) );
ys = scale * ( [ys' ys(1)] - mean(ys) );

% Writes out points to directory
dlmwrite( 'TeacupPts.txt', [xs;ys] );

%%%%%%%%%%%%%%%%%%%%%%
% Read them back in again - put this in the top of your script
xsys = dlmread('TeacupPts.txt');

% Get x and y points back out
xs = xsys(1,:);
ys = xsys(2,:);

% Plot the points
plot(xs,ys, '-k');
