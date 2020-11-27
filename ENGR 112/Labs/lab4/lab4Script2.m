%Andrew Brown Lab 4 Script 2

clc
clear
close all

%Practice making an anonymous function

lab4Script2Anonymous=@(x) sin(2*pi.*x).*(4.*x.^(2)+3);

fplot(lab4Script2Anonymous,[-8,8],'k')
title('A Function')
xlabel('X')
ylabel('Y')
fprintf('For x = -1.25, y = %0.6f\n',lab4Script2Anonymous(-1.25))
fprintf('For x = 1.25, y = %0.6f\n',lab4Script2Anonymous(1.25))

