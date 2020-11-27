%Andrew Brown Homework 6 Problem 5

clc
clear
close all

%Physics of a harmful fall on different planets using loops

%Define given constants
massPounds=120; %mass in pounds
massKg=massPounds/2.246; %mass in kilograms
PlanetNames={'Mercury','Venus','Earth','Mars','Jupiter','Saturn','Uranus','Neptune','Pluto'}; %array of planet names
newPlanet=input('New Planet Gravity:'); %user input for a new planet's gravity in m/s^2
gValues=[3.61, 8.83, 9.81, 3.75, 26.0, 11.2, 10.5, 13.3, 0.61]; %accelerations due to gravity in m/s^2
dlmwrite('gValues.txt',gValues)

%If the new planet is identical in size to an existing planet, say so, if
%not, add the new planet to gValues and run it through the rest of the
%code
if newPlanet~=gValues
    gValues(10)=newPlanet; %adds the new planet gravity to a new index in gValues
else
    EqualPlanet=find(newPlanet==gValues); %stores the new planet as the array index of its equal planet in gValues
    fprintf('The size of your planet is identical to %s\n',PlanetNames{EqualPlanet(1)}) %Prints the planet that is equal to the new planet input
end
h=linspace(1,200,200); %height off the ground in meters

%Calculate the energy given off by falling on each planet from variable
%heights
EPlanetStore=zeros(1,length(h)); %Pre-allocate the energy for the fall on each plannet
for i=1:length(gValues)
    EPlanet=massKg*gValues(i)*h; %energy generated from the fall in joules on earth
    EPlanetStore(i, :)=EPlanet;
end

%Calculate the height of an equivalent fall on differnet planets
PlanetHeightStore=zeros(1,length(h)); %Pre-allocate the individual planet heights
for k=1:length(gValues)
    PlanetHeight=EPlanetStore(3,10)/(gValues(k)*massKg);
    PlanetHeightStore(k)=PlanetHeight;
end

%Plotting the graph for energy generated from a fall on Earth and the
%equivalent falls on different planets
for j=1:length(gValues)
    hold on
    plot(h,EPlanetStore(j, :))
    plot(PlanetHeightStore(j),EPlanetStore(3,10),'r*')
end

%Misc. graph labels, legend, and defining axes.
title('Energy Generated from a fall on Different Planets')
xlabel('Height (m)')
ylabel('Energy (J)')
axis([0,200,0,10^4])

%Make array for the legend labels so we can exclude the new planet labels
%if they do not exist
legendLabels={'Mercury','Equivalent fall for Mercury','Venus',...
    'Equivalent fall for Venus','Earth','Equivalent fall for Earth',...
    'Mars','Equivalent fall for Mars','Jupiter',...
    'Equivalent fall for Jupiter','Saturn','Equivalent fall for Saturn',...
    'Uranus','Equivalent fall for Uranus','Neptune',...
    'Equivalent fall for Neptune','Pluto','Equivalent fall for Pluto',...
    'New Planet','Equivalent fall for New Planet'};
legend(legendLabels(1:length(gValues)*2)) %make the legend relying off the length of gValues

