function [ tryCandy ] = MyPickCandy( rank )
%PickCandy Pick one randomly based on the rank values
%   Throw a die and see what bin it lies in
%   See lecture notes

% Generate a number between 1 and the number of candies
sumCandy = sum(rank);
pickVal = rand(1)*sumCandy;

if pickVal>=0 && pickVal<=3
    tryCandy=1;
elseif pickVal>3 && pickVal<=8
    tryCandy=2;
elseif pickVal>8 && pickVal<=12
    tryCandy=3;
elseif pickVal>12 && pickVal<=18
    tryCandy=4;
elseif pickVal>18 && pickVal<=28
    tryCandy=5;
elseif pickVal>28 && pickVal<=37
    tryCandy=6;
elseif pickVal>37 && pickVal<=46
    tryCandy=7;
end

