function [name,dashes] = JoinName(name,last)
%JOINNAME concatenates a first and last name in the form lastname_firstname
%and removes any dashes by calling REMOVEDASHES
name=strcat(last,'_',name); %concatenate the strings
[name,dashes] = RemoveDash(name); %remove dashes
end

