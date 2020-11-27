%% This is an incomplete code that explains the flowchart on the screen
% 1- analyze this code and the output
% 2- Add comments to help yourself understand what the code is doing
% 3- Complete the code according to the flowchart on the screen.
% 4- Make any changes or edits that make sense to your code


clc
clear
close all

numdays=10;
T= 1:numdays; %Days
fprintf('On a range -10 the saddest to 10 the happiest \n')
%% commented code to allow rapid debugging. random mood values are assigned into an array in line 18

for i=1:numdays 
    fprintf('Day %2.0f \t', T(i))
    Mood(i)=input('What is your mood today? \n');
end
%% 
% Mood= [4 9 -3 2 -9]; % test for debugging .. delete and use user input when ready
plot (T,Mood,'or', 'MarkerSize', 10);
title('Mood plot');
xlabel('Time (days)');
ylabel('Mood');
%fprintf('Your mood on day %4.0f was %4.0f \n',3,Mood(3)); %Find mood on day 5
xi= input('At what time would you like to find an interpolation of your mood? \n');
yi=interp1(T,Mood,xi,'Linear');
fprintf('the estimate of your mood on time %4.2f is %4.2f \n now check the plot' ,xi,yi)
hold on
plot(xi,yi,'Xg');
title('(Default) Linear Interpolation');
%% Now interpolation for all points between 0 and 5 
pause (2) % wait for a few seconds before interpolating everything else
xidata=1:0.1:numdays;
yidata=interp1(T,Mood,xidata,'Linear');
hold on
plot(xidata,yidata,'*b');
yinpoly= polyfit(xidata,yidata,5);

fittedy=polyval(yinpoly,xidata);
pause(3) % hmmm what is this?
hold on
plot(xidata,fittedy,'--k');
% Now, evaluated fitted y outside the boundaries
pause(3)
xidata= 0:0.1:numdays+1;

for index = 1:length(xidata)
    ZeroFunc=@(x) polyval(yinpoly,xidata);
    fReturn(index) = fzero(ZeroFunc,xidata(index));
end
fittedy=polyval(yinpoly,xidata);
hold on
plot(xidata,fittedy,'--g');


 
