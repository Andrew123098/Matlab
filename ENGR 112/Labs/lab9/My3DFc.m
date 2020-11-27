function [x,y,z] = My3DFc(t)
%MY3DFC Takes in an array 't' and creates points for a 3D polar rose
n=4; %Polar rose value
d=3; %Polar rose value
r=cosd(n/d*t); %given equation
x=r.*cosd(t); %given equation for x points
y=r.*sind(t); %given equation for y points
z=cosd(t); %given equation for z points
end

