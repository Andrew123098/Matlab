%Andrew Brown Lab 9 Script 3

clc
clear
close all

%Plot your shape from problem 2 in 3D. Use a function to create x,y, and z
%Create a wavy surface and plot is using surf

%Create a polar rose with given values
identity3=eye(3); %identity matrix
t=linspace(1,10000,10000);



%Call My3DFc to get the 3D points of a polar rose with input t
[x,y,z] = My3DFc(t);

%plot the original polar rose
subplot(2,2,3)
plot(x,y)
axis equal

%Plot the 3D polar rose
subplot(2,2,1)
plot3(x,y,z,'k')

%Make the survafe of the 3D polar rose
s=linspace(-pi,pi); %given value
t=linspace(-pi,pi); %given value

%make a blanket
[S,T]=meshgrid(s,t);

%Create the right values to pass through surf
[Z] = mySrfF(S,T);

%call surf and then the better surf
subplot(2,2,2)
surf(S,T,Z); %plot the regular surf
subplot(2,2,4)
surf(S,T,Z,'FaceColor',[0.5,0.5,0.5],'EdgeColor','None'); %plot the colored structured surf
camlight left %add depth
lighting phong %add lighting
