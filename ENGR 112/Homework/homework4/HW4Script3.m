%Homework 4 Problem 3

clc
clear

%Calculate pi with first method
loopNum=0; %set the initial number of loops to zero
valuePi=0; %Set the initial value of value pi to zero
i=1; %set i equal to 1
while valuePi<3.14159-0.0000001 || valuePi>3.14159+0.0000001 %Only run loop until sufficiently accurate (10^-5)
    loopNum=loopNum+1; %count the number of loops
    myPi0=4/i; %given equation to find pi
    myPi(loopNum)=myPi0; %store the values of myPi in an array
    if mod(loopNum,2)~=0 %run if number of loops is odd
        realPi(loopNum)=myPi(loopNum); %realPi index is positive version of myPi index
    else %Run if number of loops is not odd (even)
        realPi(loopNum)=-myPi(loopNum); %realPi index is negative version of myPi index
    end
    valuePi=valuePi+realPi(loopNum); %calculate the value of pie using the array realPi
    i=i+2; %count odd numbers
end

fprintf('First Method: %0.0f iterations, \n',loopNum) %Print out number of iterations
fprintf('Pi=%0.12f\n',valuePi) %Print out calculated value of pi
clear

%Calculate pi with second method
loopNum=0; %set the initial number of loops to zero
valuePi=0; %Set the initial value of value pi to zero
i=2; %Set i equal to 2
while valuePi<0.14159-0.00001 || valuePi>0.14159+0.00001 %Only run loop until sufficiently accurate
    loopNum=loopNum+1; %count the number of loops
    myPi0=4/(i*(i+1)*(i+2)); %given equation to find pi
    myPi(loopNum)=myPi0; %store the values of myPi in an array
    if mod(loopNum,2)~=0 %run if number of loops is odd
        realPi(loopNum)=myPi(loopNum); %realPi index is positive version of myPi index
    else %Run if number of loops is not odd (even)
        realPi(loopNum)=-myPi(loopNum); %realPi index is negative version of myPi index
    end
    valuePi=valuePi+realPi(loopNum); %calculate the value of pie using the array realPi
    i=i+2; %make i count even numbers
end
valuePi=valuePi+3; %add the 3 to value pi as specified by the given equation

fprintf('Second Method: %0.0f iterations, \n',loopNum) %Print out number of iterations
fprintf('Pi=%0.12f\n',valuePi) %print out final calculated value of pi
