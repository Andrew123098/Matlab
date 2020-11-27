%% An example of using matrix transformations to create 
%   multiple copies of an object

% Clear everything
clear
clc
clf

% Points defining a circle. 
t = linspace(0, 2*pi, 64);
xPtsCircle = cos(t); % x values
yPtsCircle = sin(t); % y values

% Make a matrix from the points. Make sure to add a one to the bottom row
% so that matrix multiplication for translation will work correctly
ptsCircle = ones( 3, length(t) );
% Set the first two rows to be the x and y points
ptsCircle(1,:) = xPtsCircle;
ptsCircle(2,:) = yPtsCircle;

% Temporary plot to see what we're doing
subplot(1,2,1);
plot( ptsCircle(1,:), ptsCircle(2,:), '-k' );
axis equal; % Make circle circle

%% Now make a face by adding eyes and part of the mouth
eyeScl = 0.1; % How much smaller to make the eyes
matSclEye = [eyeScl 0 0; 0 eyeScl 0; 0 0 1]; % Matrix to scale the eyes

eyeDx = 0.3; % How much to move the eye over
eyeDy = 0.2; % and up
matTransEye = eye(3); % Identity matrix
matTransEye( 1,3 ) = -eyeDx; % Amount to move in x goes in right column
matTransEye( 2,3 ) =  eyeDy; % Amount to move in x goes in right column

% Make points for left eye. Scale happens first
ptsLeftEye = matTransEye * matSclEye * ptsCircle;

% Check left eye
hold on;
plot( ptsLeftEye(1,:), ptsLeftEye(2,:), '-g' );

matTransEye( 1,3) = eyeDx;
ptsRightEye = matTransEye * matSclEye * ptsCircle;

% Check right eye
plot( ptsRightEye(1,:), ptsRightEye(2,:), '-b' );

% The mouth
mouthScl = 0.6; % A bit smaller than the head, shrink in y
matSclMouth = [mouthScl 0 0; 0 0.5 * mouthScl 0; 0 0 1]; % Matrix to scale the mouth
matTransMouth = eye(3);
matTransMouth( 2,3 ) = -0.4; % Move bottom of circle arc down

% Take *part* of the circle and make it be the mouth
ptsMouth = matTransMouth * matSclMouth * ptsCircle( :, floor(length(t)/2):end );

% Check mouth
plot( ptsMouth(1,:), ptsMouth(2,:), '-r' );

%% Multiple copies

% Stick all the points together into one big matrix of points
ptsAll = [ ptsCircle ptsLeftEye ptsRightEye ptsMouth ];

% Draw multiple copies of face
matTrans = eye(3);
subplot(1,2, 2);
for r = 1:2
    matTrans( 2, 3 ) = 2*r; % Move up each time
    for c = 1:3
        matTrans( 1, 3 ) = 2*c; % Move right each time
        
        % Translate points
        ptsMove = matTrans * ptsAll;
        plot( ptsMove(1,:), ptsMove(2,:), '.k' );
        hold on;
    end
end
axis equal % Make sure circles are circles
