%Andrew Brown Homework 8 Problem 1

clc
clear

%Tragedy of the Commons Fish Example Practice with Structs

fprintf(strcat('This is an educational interactive simulation that\n',...
    'teaches the concept Tragedy of The Commons.\nYou will start with a',...
    ' specific number of fish in the lake.\nThe four fishers will be able',...
    ' to catch as many fish they want\nin the lake every day.\nBut the fish',...
    ' will reproduce and grow by the next morning\nat a rate of 0.5 of what',...
    ' is left in the lake.\n\nThe simulation starts now:\n\n'))

fish.Total(1) = 12; %Initialize the number of fish in the pond
rate=1.5; %fish reproduction rate per day

%Print out the # on fish in the pond on day 1
fprintf('Day 1: There is %0.0f fish in the lake\n\n', fish.Total)

%print out the # of fish each fisher will try to catch
fish.Abe(1) = input('How many fish will Abe try to catch?\n');
fish.Barbra(1) = input('How many fish will Barbra try to catch?\n');
fish.Cat(1) = input('How many fish will Cat try to catch?\n');
fish.Dave(1) = input('How many fish will Dave try to catch?\n');

%End the simulation if they fish all the fish out of the pond on day 1
if fish.Total(1)<=(fish.Abe(1)+fish.Barbra(1)+fish.Cat(1)+fish.Dave(1))
    fprintf('Too Bad!\nThe Tragedy of the commons in upon us!\n')
    fprintf('You fished all 12 fish on day 1 ya idiot!\n')
    return %end script
end

%Ask the user if they would like to automate and separate code into 2 parts
automate = ["Y","N"]; %string for comparison for yes or no to automation
sim=input('Would you like to automate the fishers behavior until the end of the simulation? Press Y or N\n','s'); %Ask the use for a Y or N input

%Keep asking the user for Y or N until they have the proper input
while strcmpi(sim,automate(1))==0 && strcmpi(sim,automate(2))==0
    sim=input('Invalid entry, Please press Y or N\n','s');
end

% This is where the code splits into 2 branches, automated and not
if strcmpi(sim,automate(1))==1 %run if user input is "Y"
    i=1; %add a counter
    %Run while the total number of fish in the pond can be fished
    while fish.Total(i)>= fish.Abe(i)+fish.Barbra(i)+fish.Cat(i)+fish.Dave(i)
        fish.Abe(i+1)=fish.Abe(i); %Automate Abe's fishing
        fish.Barbra(i+1)=fish.Barbra(i); %Automate Barbra's fishing
        fish.Cat(i+1)=fish.Cat(i); %Automate Cat's fishing
        fish.Dave(i+1)=fish.Dave(i); %Automate Dave's fishing
        fish.Total(i+1)=floor(rate*(fish.Total(i)-fish.Abe(i)-fish.Barbra(i)-fish.Cat(i)-fish.Dave(i)));
        i=i+1; %Add 1 to the counter
        check=0;
        if fish.Total(i)==fish.Total(i-1) %if the # of fish in the pond stays the same over time
            check=1; %check if sustainable
            fprintf('Well done!\nIt looks like the practices of the fishers are sustainable!\n')
            fprintf('There will be %0.0f fish in the lake for a very long time\n',fish.Total(1))
            break %end the loop
        end
    end
    if check==0 %if the fishing practices are not sustainable
        fprintf('Too Bad!\nThe Tragedy of the commons in upon us!\n')
        fprintf('There is only %0.0f fish in the lake by day %0.0f. Not enough to feed everyone.\n',fish.Total(end),i)
    end
elseif strcmpi(sim,automate(2))==1 %Run if user input is "N"
    i=1; %add a counter
    while fish.Total(i)>= fish.Abe(i)+fish.Barbra(i)+fish.Cat(i)+fish.Dave(i) %run while total fish is greater than fish taken
        fish.Total(i+1)=floor(rate*(fish.Total(i)-fish.Abe(i)-fish.Barbra(i)-fish.Cat(i)-fish.Dave(i))); %Calculate total fish in lake in the morning
        if fish.Total(end)<=4 %end the loop if there is not enough fish for everyone to eat
            break
        end
        fprintf('Day %0.0f: There are %0.0f fish in the lake\n\n',i+1,fish.Total(i+1)) %Print the day and total fish
        fish.Abe(i+1)=input('How many fish will Abe try to catch?\n'); %Get user to give the amount of fish caught
        fish.Barbra(i+1)=input('How many fish will Barbra try to catch?\n'); %Get user to give the amount of fish caught
        fish.Cat(i+1)=input('How many fish will Cat try to catch?\n'); %Get user to give the amount of fish caught
        fish.Dave(i+1)=input('How many fish will Dave try to catch?\n'); %Get user to give the amount of fish caught
        i=i+1; %add 1 to counter
    end
    if fish.Total(i+1)<fish.Abe(i)+fish.Barbra(i)+fish.Cat(i)+fish.Dave(i) %run while total fish is greater than fish taken
        fprintf('Too bad!\nThe tragedy of the commons is upon us!\n')
        fprintf('There is only %0.0f fish in the lake by day %0.0f. Not enough to feed everyone.\n',fish.Total(end),i+1)
    end
end

%Extra Credit: Write the Data to a text file
fid=fopen('FishData.txt','wt+'); %open the new file and write to it
fprintf(fid,'Abe,Barbra,Cat,Dave,Total\n'); %give titles to each column
for i=1:length(fish.Abe) %loop for length of rows
    fprintf(fid,'%0.0f,%0.0f,%0.0f,%0.0f\n',fish.Abe(i),fish.Barbra(i),fish.Cat(i),fish.Dave(i)); %write
end
fclose(fid); %close the file