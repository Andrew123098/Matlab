function [S,I,R,N] = DisSimulate(nSteps)
%DISEASE SIM:
%   Calls DiseaseStep 140 times with 140 being the length of nSteps
a=10; %the contact rate: the average # of people a person comes in contact with.
b=1.25; %the amount of time in days that a person is infectious
S0=0:500:2000; %Susceptibles, those who have never had the illness and can catch it.
I0=100; %Infectives, those who are infected and are contagious.
R0=0; % Recovered, those who already had the illness and are immune.
h=0.05; %timestep in days
S(1, :)=S0; %Set first row of S to the S0 array
I(1, :)=I0; %Set the first row of I to all equal the constant I0
R(1, :)=R0; %Set the first row of R to all equal the constant R0

for i=1:(length(nSteps)-1) %run until S, I, and R have 140 values
    [S,I,R,N] = DisStep(S,I,R,S0,I0,R0,a,b,h,nSteps(i)); %call DiseaseStep and loop through the nSteps array
    S0=S; %Update with new S0
    I0=I; %Update with new I0
    R0=R; %Update with new R0
end

end

