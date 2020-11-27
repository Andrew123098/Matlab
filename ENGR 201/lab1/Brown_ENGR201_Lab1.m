%Andrew Brown ENGR 201 Lab 1

clc
close all

%Plot voltage vs current

voltage = [2,4,6,8,10,12];
current = [0.0202,0.0404,0.0606,0.0808,0.1010,0.1212];

%Plot current vs voltage
plot(current,voltage,'*b','Markersize',12);
xlabel('Current (mA)');
ylabel('Volatge (V)');
title('Current vs. Voltage')
axis([0,0.15,0,15]);

coeffs = polyfit(current,voltage,1);
fprintf('Slope: %f\nY-int: %f\n',coeffs(1),coeffs(2))



