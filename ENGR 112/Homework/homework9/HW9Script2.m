%Andrew Brown Homework 9 Problem 2

clc
clear
close all

%Practice with graphing in 3D and adding color to the graph

%Define given variables
x=linspace(-0.5,0.5,11); %in-plane coordinate
y=linspace(-0.5,0.5,11); %in-plane coordinate
[x,y]=meshgrid(x,y); %Create the grid vectors of x and y
k=0.77; %curvature

%Define gven equation with the given variables
z=k*(x.^(2)-y.^(2));

%Top View
subplot(4,2,1)
surf(x,y,z)
colormap('summer')
axis equal
view([90,90])
title('Deformed Composite Top View')

%Perspective View
subplot(4,2,2)
surf(x,y,z)
colormap('summer')
axis equal
view([30,30])
title('Deformed Composite Perspective View')

%Front View
subplot(4,2,3)
surf(x,y,z)
colormap('summer')
axis equal
view([0,0])
title('Deformed Composite Front View')

%Side View
subplot(4,2,4)
surf(x,y,z)
colormap('summer')
axis equal
view([90,0])
title('Deformed Composite Side View')

%Reconstruct the composite
minx=min(x,[],'all'); %minimum of x matrix
maxx=max(x,[],'all'); %maximum of x matrix
rangex=linspace(minx,maxx,3); %range b/w the min and max of x
miny=min(y,[],'all'); %minimum of y matrix
maxy=max(y,[],'all'); %maximum of y matrix
rangey=linspace(miny,maxy,4); %range b/w the min and max of y
[rangex,rangey]=meshgrid(rangex,rangey);%run the ranges through meshgrid
z2=k*(rangex.^(2)-rangey.^(2));%find another z with the new x and y points
newZ=interp2(rangex,rangey,z2,x,y); %find interpolated z values

%Top View
subplot(4,2,5)
surf(x,y,newZ)
colormap('summer')
axis equal
view([90,90])
title('Reconstructed Composite Top View')

%Perspective View
subplot(4,2,6)
surf(x,y,newZ)
colormap('summer')
axis equal
view([30,30])
title('Reconstructed Composite Perspective View')

%Front View
subplot(4,2,7)
surf(x,y,newZ)
colormap('summer')
axis equal
view([0,0])
title('Reconstructed Composite Perspective View')

%Side View
subplot(4,2,8)
surf(x,y,newZ)
colormap('summer')
axis equal
view([90,0])
title('Reconstructed Composite Perspective View')
colorbar

