function [x,y,z] = Staircase(a,b,h,n,t)
%STAIRCASE Takes in 3D elipse parameters and returns the x,y, and z
%coordinates needed to plot the given elipse
E=sqrt(1-(b^(2)/(a^(2)))); %elipse eccentricity
r=b./sqrt(1-(E.*cosd(t)).^(2)); %elipse radius
x=r.*cosd(t); %x coordinates
y=r.*sind(t); %y coodinates
z=(h.*t)./(2*pi*n); %z coodinates
end

