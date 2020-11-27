% Andrew Brown Homework 2 Problem 5

clc
clear
clf

%Teacup Part 2

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Read them back in again - put this in the top of your script
xsys = dlmread('TeacupPts.txt');

% Get x and y points back out
xs = xsys(1,:);
ys = xsys(2,:);

% Plot the points from the original sketch at the origin
subplot(1,3,1)
plot(xs,ys, '-k');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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


%Part1.2a


%Define constants
theta=-25; %degrees
dx=-9.52; %translation distance in meters
dy=-3.05;%translation distance in meters

%Rotation then translation of the initial points.
%Rotation of the teacup points
x0RotateTeacup=(xs*cosd(theta))-(ys*sind(theta));
y0RotateTeacup=(xs*sind(theta))+(ys*cosd(theta));

%Translation of the teacup with rotation positions
xTranslationTeacup=x0RotateTeacup+dx;
yTranslationTeacup=y0RotateTeacup+dy;

%Plot the rotated, then translated teacup with the plate
subplot(1,3,2)
plot(xTranslationTeacup,yTranslationTeacup,'-k')
hold on
plot(x,y,'b')
axis equal
title('Teacup on Platter, Final')
xlabel('Meters')
ylabel('Meters')
legend('Teacup','Platter')

%Rotate again using translation positions
x1RotateTeacup=(xTranslationTeacup*cosd(theta))-(yTranslationTeacup*sind(theta));
y1RotateTeacup=(xTranslationTeacup*sind(theta))+(yTranslationTeacup*cosd(theta));

%Plot position after second rotation with plate
subplot(1,3,3)
plot(x1RotateTeacup,y1RotateTeacup,'-k')
hold on
plot(x,y,'b')
axis equal
title('Teacup on Platter, Extra Credit')
xlabel('Meters')
ylabel('Meters')
legend('Teacup','Platter')

