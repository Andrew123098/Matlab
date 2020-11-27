%Andrew Brown Homework 8 Problem 2

clc
clear

% Richter Scale 

%Define the given table 
RichterScale=[2,2.5,3,3.5,6,6.1,8.5,8.6,9.9,10]; %Richter scale
KKI=[1e-3,6e-3,3.2e-2,0.18,10e4,2e4,5.6e6,8e6,5e8,1e9]; %Kelly Kiloton Index

%Data Points 
subplot(2,3,1)
plot(RichterScale,KKI,'.r','Markersize',15)
xlabel('Richter Scale')
ylabel('Kelly Kiloton Index')
title('Data Points')

%Linear
P1=polyfit(RichterScale,KKI,1);
polyFunc1=@(RichterScale) polyval(P1,RichterScale);
subplot(2,3,2)
plot(RichterScale,KKI,'.r','Markersize',15)
hold on
fplot(polyFunc1)
xlabel('Richter Scale')
ylabel('Kelly Kiloton Index')
title('Linear Fit')

%Quadratic
P2=polyfit(RichterScale,KKI,2);
polyFunc2=@(RichterScale) polyval(P2,RichterScale);
subplot(2,3,3)
plot(RichterScale,KKI,'.r','Markersize',15)
hold on
fplot(polyFunc2)
xlabel('Richter Scale')
ylabel('Kelly Kiloton Index')
title('Quadratic Fit')

%Exponential
PExp=polyfit(RichterScale,log(KKI),1);
polyFuncExp=@(RichterScale) exp(PExp(2))*exp(PExp(1)*RichterScale);
subplot(2,3,4)
plot(RichterScale,KKI,'.r','Markersize',15)
hold on
fplot(polyFuncExp)
xlabel('Richter Scale')
ylabel('Kelly Kiloton Index')
title('Exponential Fit')

%Power
PPo=polyfit(log(RichterScale),log(KKI),2);
polyFuncPo=@(RichterScale) polyval(PPo,exp(RichterScale));
subplot(2,3,5)
plot(RichterScale,KKI,'.r','Markersize',15)
hold on
fplot(polyFuncPo)
xlabel('Richter Scale')
ylabel('Kelly Kiloton Index')
title('Power Fit')

%Logartithmic
PLog=polyfit(log(RichterScale),KKI,1);
polyFuncLog=@(RichterScale) PLog(1)*log(RichterScale)+PLog(2);
subplot(2,3,6)
plot(RichterScale,KKI,'.r','Markersize',15)
hold on
fplot(polyFuncLog)
xlabel('Richter Scale')
ylabel('Kelly Kiloton Index')
title('Logarithmic Fit')

%Exponential is the best fit for the data
newVal=polyFuncExp (5); %Calculate exponential @ richter=5

%Calculate the inverse of the exponential functions
polyFuncBuilding=@(KKI) (1/PExp(1))*log(KKI/exp(PExp(2)));
Mag=polyFuncBuilding(4000000);

fprintf('The KKI for a richter of 5 is %0.2f\n',newVal)
fprintf('4 million KKI is created from a %0.2f Richter earthquake\n',Mag)
fprintf('I would not accept the building proposal for a building that can only withstand a 7.0 quake\n')

