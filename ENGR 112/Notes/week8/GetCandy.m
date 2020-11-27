function [ candy ] = GetCandy( filename )
%GetCandy Read in and set up candy from file
%   Get headers, costs

% Going to store our candy in a struct
%  We will be adding one array for candy name (note that this is a cell
%  array), amount, and cost.
%       LAB TIP: Later you will modify the code to work with another array of
%       goodness values (a numeric rating from 1-10). 
candy = struct;

%% Read in the headers and the amount of candies from a file
%   file has candy name as headers; the second row is the costs
%   csvread(name, rowstart, columnstart)
fid = fopen( filename, 'r' );
% Get all the data as a cell array
strCandies = textscan(fid, '%s', 'Delimiter',',');
strCandies = strCandies{1};
fclose(fid);

%% Try adding a break point here so that you can see how the data is stored. 
%   LAB TIP: Doing this will help you locate the candyGoodness values.
candyData = csvread( filename, 1, 0 );

% Use this function to add in each candy type - this function makes sure
% that all of the parts of the struct are set up correctly
for k = 1:length( candyData )
    % LAB TIP: Notice that we are just indexing data from the first row right now.
    % Once AddCandy() gets modified it will need to take a new parameter from
    % the second row in candyData.
    candy = AddCandy( candy, strCandies{k}, candyData(1,k));
end

end

