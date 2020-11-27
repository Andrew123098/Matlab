function [mSign,m] = FindEpidemic(I,S0,h)
%FINDEPIDEMIC determies hat starting population is needed to start an
%epidemic.

m=ones(1,length(S0)); %preallocate slope
mSign=ones(1,length(S0)); %preallocate slope sign
for i=1:length(S0) %run the length of S0 times
    m(i)=(I(2,i)-I(1,i))/h; %given formula
    if m(i)<=0 % save the slope sign
        mSign(i)=-1;
    elseif m(i)>0
        mSign(i)=1;
    end
end
end
