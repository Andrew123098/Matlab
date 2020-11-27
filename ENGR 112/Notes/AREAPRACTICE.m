clc
clear
clf

%calculate area using given polynomial
y=[1,-1,0,0,0];
area=polyint(y,6.3);
realarea=polyval(area,6.3);
disp(realarea)


%calculate area using given data points
x1=[0,1,1.5,3,4,5,6.1,6.3];
y1=[0,1,3,4,3.5,1,3.3,0];
plot(x1,y1)

%how to integrate using given data points when we dont have a polynomial or
%an accurate fit line

area1=trapz(x1,y1); %sort of like a reinmann sum using data point arrays
disp(area1)


