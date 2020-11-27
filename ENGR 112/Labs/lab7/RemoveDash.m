function [name,dashes] = RemoveDash(name)
%REMOVEDASH Takes in a string and returns the same string with no dashes
dashes=strfind(name,'-'); %index where the dashes occur in the char array
name(dashes)=[]; %delete the dashes
end