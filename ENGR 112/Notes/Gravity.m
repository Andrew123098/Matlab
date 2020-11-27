mass1=60;  %Average human mass
mass2=5.97219e24; %earth mass
mass3=7.34767309e22; %moon mass
dist1=6.38e6; %distance to earth's center
dist2=1737400;
constG=6.67e-11; %gravitational constant

forceG1=(constG*mass1*mass2)/(dist1*dist1)
forceG2=(constG*mass1*mass3)/(dist2*dist2)
forceG3=(constG*mass1*mass1)/10 %force of gravity b/n 2 humans 10 meters apart