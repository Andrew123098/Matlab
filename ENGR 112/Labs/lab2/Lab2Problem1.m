%Andrew Brown Lab 2 Problem 1

clc
clear

%I am practicing using arrays with mathmatical calculations.

x=[0.1,10.2,12.8]; %Units are radians
y=((sqrt(2*x).*(4*x.^3)))./((4*x)+(7.^(x/10)));
z=log10((2*x)+5)+(((4*x)+exp(x))./((2/3)+(4*x.^2)));

%Practice using the "fprintf" function.
fprintf('For x = %0.6f radians, y is %0.6f, and z is %0.6f.\n', x(1), y(1), z(1))
fprintf('For x = %0.6f radians, y is %0.6f, and z is %0.6f.\n', x(2), y(2), z(2))
fprintf('For x = %0.6f radians, y is %0.6f, and z is %0.6f.\n\n', x(3), y(3), z(3))


%Practice using a for loop to print different array values.
for i=1:3
    fprintf('For x = %0.6f radians, y is %0.6f, and z is %0.6f.\n', x(i), y(i), z(i))
end 
   