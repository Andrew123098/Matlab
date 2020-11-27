%Andrew Brown Homework 9 Problem 4

clc
clear
close all

%Teacup Part 5

% Read them back in again - put this in the top of your script
xsys = dlmread('TeacupPts.txt');

% Get x and y points back out
xs = xsys(1,:);
ys = xsys(2,:);
pts = [xs;ys;ones(1,length(xs))];

% Plot the points from the original sketch at the origin
subplot(1,2,1)
plot(xs,ys, '-k');

%Plot the plate as a circle of radius 10
hold on
radius=10;
angle=linspace(0,2*pi,720);
x=cos(angle)*radius;
y=sin(angle)*radius;
plot(x,y,'b')
axis equal
title('Teacup on Platter, Initial')
xlabel('Meters')
ylabel('Meters')
legend('Teacup','Platter')

%Define constants
theta1=-25; %degrees
theta2=60; %degrees
dx=radius; %translation distance in meters
dy=0;%translation distance in meters
sx=0.5; %x scale values
sy=0.5; %y scale values

%Define the Translation, Rotation, and Scaling matrices
[mTrans] = Translation(dx,dy); %translation matrix
[mRot] = Rotation(theta1); %rotation matrix
[mScale] = Scale(sx,sy); %scale matrix


%Calculations
rotTansScale=mTrans*mRot*mScale*pts; %Rotate then translate then scale
transRotScale=mRot*mTrans*mScale*pts; %Translate then rotate then scale
ptsMoved=mRot*mTrans*mRot*mScale*pts; %Rotate then translate then rotate then scale

%Plot the rotated translated then rotated then scaled teacup with the plate
subplot(1,2,2)
plot(ptsMoved(1,:),ptsMoved(2,:),'-k')
hold on
plot(x,y,'b')
axis equal
title('Teacup on Platter, Final')
xlabel('Meters')
ylabel('Meters')
legend('Teacup','Platter')
