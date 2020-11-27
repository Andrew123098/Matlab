%Andrew Brown Lab 9 Problem 2

clc
clear
close all

%Use a function (polar rose or spiral or anything else reasonable) to
%create (x,y) points. Move it to a new location using a rotation followed
%by a translation. Plot it again. Extra credit: Plot multiple copies in a 
%circle or a grid or some other pattern using a for loop.

%Create a polar rose with given values
n=4;
d=3;
t=linspace(1,10000,10000);
rt=cosd(n/d*t); %given equation
xt=rt.*cosd(t); %given equation for x points
yt=rt.*sind(t); %given equation for y points
identity3=eye(3); %identity matrix

%Plot the original polar rose
plot(xt,yt)
axis equal

%Define given variables and rotation matrix
mRot=identity3;
theta=25; %degrees
mRot(1,1)=cosd(theta); %make rotation matrix
mRot(1,2)=sind(theta); %make rotation matrix
mRot(2,1)=-sind(theta); %make rotation matrix
mRot(2,2)=cosd(theta); %make rotation matrix

%Define given variables and translation matrix
identity3=eye(3);
mTrans=identity3; %idendtity matrix
dx=5; %change in x
dy=1.5; %change in y
mTrans(1,3)=dx; %make translation matrix
mTrans(2,3)=dy; %make translation matrix

%Turn x and y vectors into a 3xn matrix
pts=[xt;yt;ones(1,length(xt))];

%Multiply the matrices by the x and y points
ptsNew=mTrans*mRot*pts;

%Plot the new translated rose
hold on
plot(ptsNew(1,:),ptsNew(2,:))




