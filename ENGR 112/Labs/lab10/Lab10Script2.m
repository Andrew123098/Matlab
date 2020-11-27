% Andrew Brown Lab 10 Script 2

clc
clear
close all

% Practice with surf

%Read in the given data
x=dlmread('srfX.txt');
y=dlmread('srfY.txt');
z=dlmread('srfZ.txt');

%plot the surface with the given surf data
subplot(1,3,1)
surf(x,y,z,'Facecolor',[0.5,0.5,0.5],'Edgecolor','none')
camlight left %left lighting
lighting phong %phong lighting
axis equal
title('Original Surface')

%plot the average of the circles of the given data
subplot(1,3,2)
xs=mean(x); %avg of x vals
ys=mean(y); %avg of y vals
zs=mean(y); %avg of z vals
plot3(xs,ys,zs,'Linewidth',1.2) %plot a 3D line
axis equal
title('Centerline')

%plot both the line and the surface (transparent)
subplot(1,3,3)
surf(x,y,z,'Facecolor','k','Edgecolor','none') %plot surface
alpha(0.2) %make surface transparent
hold on
plot3(xs,ys,zs,'k','Linewidth',4) %plot line
camlight left %left lgihting
lighting phong %phong lghting
axis equal
title('Surface with Centerline')
