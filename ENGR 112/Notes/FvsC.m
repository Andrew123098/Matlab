clc
clear

F=[32:10:212];
c=(F-32)*(5/9);

plot(F,c,'-or','LineWidth', 3);

xlabel('degrees F')
ylabel('degrees C')
title('F vs. C')
xlim([0,212])
ylim([0,100])
grid on


