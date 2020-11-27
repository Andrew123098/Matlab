function [bIsEpidemic,peakIValue,peakTime]=IsEpidemic(S0,I0,a,b,nSteps,h)
%ISEPIDEMIC: analyzes if there is an epidemic. If there is not do nothing,
%if there is, find the maximum amount of people infected and the time at
%which that happens

[S,I,R,N] = DisSimulate(nSteps); %Call the simmulated diseases

%Calculate maximum # of people sick and time if it is an epidemic
bIsEpidemic=zeros(1,length(S0)); %preallocate
peakTime=zeros(1,length(S0)); %preallocate
peakIValue=zeros(1,length(S0)); %preallocate
for k=1:length(S0) %run for each simulated epidemic
    if I(2,k)>I0 %if there is an epidemic (increasing number of sick people over time)
        bIsEpidemic(k)=1; %make array of true/false values to show if there is an epidemic
        peakIValue(k)=max(I(:,k)); %Find the maximum number of people infected during each simulated epidemic
        peakTime(k)=find(I(:,k)==peakIValue(k))-1; %Find the I index at its max value for each simulated epidemic
        peakTime(k)=nSteps(peakTime(k))*h; %Set the indices of I column and nStep equal to find the time at the max value
    else
        bIsEpidemic(k)=0; %make array of true/false values to show if there is an epidemic
    end
end

