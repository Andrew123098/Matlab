% Andrew Brown Homework 1 Problem 4

clc
clear

%Teacup Part 1


%Part 1.1


%Position of the center of the teacup
x0Center=0.0;
y0Center=0.0;

%Position of the handle on the teacup.
x0Handle=0.2;
y0Handle=0.5;

fprintf('Part 1.1, Positions\n  Teacup is centered at: (%0.2f, %0.2f) meters.\n', x0Center, y0Center)
fprintf('  Teacup handle is at: (%0.2f, %0.2f) meters.\n', x0Handle, y0Handle)


%Part1.2a


%Define constants
theta=-25; %degrees
dx=-9.52; %translation distance in meters
dy=-3.05;%translation distance in meters

%Rotation then translation of the initial points.
%Rotation of the centers.
x0RotatedCenter=(x0Center*cosd(theta))-(y0Center*sind(theta));
y0RotatedCenter=(x0Center*sind(theta))+(y0Center*cosd(theta));

%Rotation of the handles.
x0RotatedHandle=(x0Handle*cosd(theta))-(y0Handle*sind(theta));
y0RotatedHandle=(x0Handle*sind(theta))+(y0Handle*cosd(theta));

%Translation of the centers.
xCenterRTrans=x0RotatedCenter+dx;
yCenterRTrans=y0RotatedCenter+dy;

%Translation of the handles.
xHandleRTrans=x0RotatedHandle+dx;
yHandleRTrans=y0RotatedHandle+dy;

%Print results of rotating then translating the teacup center and handle.
fprintf('Part 1.2a, rotate teacup center by %0.2f degrees then translate by (%0.2f, %0.2f) meters.\n  Ended up at: (%0.2f, %0.2f) meters.\n', theta, dx, dy, xCenterRTrans, yCenterRTrans)
fprintf('Part 1.2a, rotate teacup handle by %0.2f degrees then translate by (%0.2f, %0.2f) meters.\n  Ended up at: (%0.2f, %0.2f) meters.\n', theta, dx, dy, xHandleRTrans, yHandleRTrans)


%Part 1.2b


%Translation then rotation of the initial points.

%Translation of the centers.
x0CenterTrans=x0Center+dx;
y0CenterTrans=y0Center+dy;

%Translation of the handles.
x0HandleTrans=x0Handle+dx;
y0HandleTrans=y0Handle+dy;

%Rotation of the centers.
xTransCenterRotation=(x0CenterTrans*cosd(theta))-(y0CenterTrans*sind(theta));
yTransCenterRotation=(x0CenterTrans*sind(theta))+(y0CenterTrans*cosd(theta));

%Rotation of the handles.
xTransHandleRotation=(x0HandleTrans*cosd(theta))-(y0HandleTrans*sind(theta));
yTransHandleRotation=(x0HandleTrans*sind(theta))+(y0HandleTrans*cosd(theta));

%Print results of translating then rotating the teacup center and handle.
fprintf('Part 1.2b, translate by (%0.2f, %0.2f) meters then rotate teacup center by %0.2f degrees.\n  Ended up at: (%0.2f, %0.2f) meters.\n', dx, dy, theta, xTransCenterRotation, yTransCenterRotation)
fprintf('Part 1.2b, translate by (%0.2f, %0.2f) meters then rotate teacup handle by %0.2f degrees.\n  Ended up at: (%0.2f, %0.2f) meters.\n', dx, dy, theta, xTransHandleRotation, yTransHandleRotation)


