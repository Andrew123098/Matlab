%Andrew Brown Lab 4 Script 1

clc
clear
close all

%Practice calling a function

fplot(@lab4Script1Function,[-8,8],'k')
title('A Function')
xlabel('X')
ylabel('Y')
fprintf('For x = -1.25, y = %0.6f\n',lab4Script1Function(-1.25))
fprintf('For x = 1.25, y = %0.6f\n',lab4Script1Function(1.25))
