function [z] = mySrfF(s,t)
%MYSRFF makes the proper z variable for using surf
z=s.^(2)+t.^(2);
end

