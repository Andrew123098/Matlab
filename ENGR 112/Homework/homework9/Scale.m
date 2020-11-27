function [mScale] = Scale(sx,sy)
%SCALE creates a scale matrix given the x and y scale values
%Define given variables and scale matrix
mScale=eye(3); %identity matrix
mScale(1,1)=sx; %scale x values
mScale(2,2)=sy; %scale y values
end

