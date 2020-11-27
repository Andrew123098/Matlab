% Andrew Brown GEEN 3582 Group Problem 2
clc
clear
close all

T = 200:200:1000;
R = 0.2081;
V = 0.2:0.2:1;

for i=1:length(T)
    isotherm = (R*T(1))/V;
end 

plot(V,P, 'b');





