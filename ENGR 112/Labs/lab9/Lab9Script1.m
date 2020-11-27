%Andrew Brown Lab 9 Problem 1

clc
clear
close all

%Use a matrix to move a house around. Transalte by (5,1.5) znd rotate by 25
%degrees then try both combination of rotating then translating

%Define given variables and translation matrix
identity3=eye(3);
mTrans=identity3; %idendtity matrix
dx=5; %change in x
dy=1.5; %change in y
mTrans(1,3)=dx; %make translation matrix
mTrans(2,3)=dy; %make translation matrix

%Translated House
subplot(2,2,1) %plot in 1st position
DrawHouse(identity3) %keep original house
hold on
DrawHouse(mTrans) %Translated house
axis equal
title('Translate')

%Define given variables and rotation matrix
mRot=identity3;
theta=25; %degrees
mRot(1,1)=cosd(theta); %make rotation matrix
mRot(1,2)=sind(theta); %make rotation matrix
mRot(2,1)=-sind(theta); %make rotation matrix
mRot(2,2)=cosd(theta); %make rotation matrix

%Rotated House
subplot(2,2,2) %plot second position
DrawHouse(identity3) %plot original house
hold on
DrawHouse(mRot) %plot rotated house
axis equal
title('Rotate')

%Translated then Rotated House
subplot(2,2,3) %plot 3rd position
DrawHouse(identity3)  %plot original house
hold on
DrawHouse(mRot*mTrans) %translated then rotated house
axis equal
title('Translate Rotate')

%Rotated then Translated House
subplot(2,2,4) %plot 4th position
DrawHouse(identity3) %plot original house
hold on
DrawHouse(mTrans*mRot) %rotated then translated house
axis equal
title('Rotate Translate')




