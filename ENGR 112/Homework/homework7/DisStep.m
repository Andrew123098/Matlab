function [S,I,R,N] = DisStep(S,I,R,S0,I0,R0,a,b,h,nSteps)
%DISEASE STEP:
%   Runs one step of he disease and spits out S, I, R, and N

%Set first rows to the given values S0, I0, and R0
if nSteps==1
    S(1, :)=S0; %Set first row of S to the S0 array
    I(1, :)=I0; %Set the first row of I to all equal the constant I0
    R(1, :)=R0; %Set the first row of R to all equal the constant R0
    S=S.*ones(1,length(S0)); %Preallocate S
    I=I.*ones(1,length(S0)); %Preallocate I
    R=R.*ones(1,length(S0)); %Preallocate R
end

%Equations used for calculations of the first timestep.
N=S0+I0+R0; %Total population
dS(nSteps, :)=(-a.*S(nSteps, :).*I(nSteps, :))./N(nSteps, :); %How S changes
dI(nSteps, :)=((a.*S(nSteps, :).*I(nSteps, :))./N(nSteps, :))-(I(nSteps, :)./b); %How I changes
dR(nSteps, :)=I(nSteps, :)./b; %How R changes

%Calculations for values over time using the previous timestep.
S(nSteps+1, :)=S(nSteps, :)+(h.*dS(nSteps, :)); %# of Sick people after time h.
I(nSteps+1, :)=I(nSteps, :)+(h.*dI(nSteps, :)); %# of Infected people after time h.
R(nSteps+1, :)=R(nSteps, :)+(h.*dR(nSteps, :)); %# of Recovered people after time h.
end

