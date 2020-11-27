% Andrew Brown Lab 3 Problem 4

clc
clear

%Write a script that keeps getting a number from the user. If that number 
%is positive, print positive; negative, print negative. If it is zero, 
%print zero and then stop. Demonstrate with any sequence that mixes 
%positives and negatives before giving it zero.

x=input('Number, please: ');
while x~=0
    if x<0
        fprintf('%0.6f is negative\n',x)
    elseif x>0
        fprintf('%0.6f is positive\n',x)
    elseif x == isNaN
        fprintf('Neither negative or positive; must be not a number NaN')
    end
    x=input('Number, please: ');
end

%If x is 0
fprintf('Neither negative or positive; must be %0.0f\n',x)


