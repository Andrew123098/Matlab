% Andrew Brown Lab 3 Problem 3

clc
clear

%Print out bottles on the wall and total until you reach at least 75

clc
clear
clf

%Practice with a while loop

%Define given variables
totalSum=0;
n=10;
saveSums=zeros(1,length(n));
saveDays=zeros(1,length(n));
k=0;

%For loop counting from 1 to 10 going up
while totalSum<75
    k=k+1;
    if k==1 %use proper grammar for the first bottle
        fprintf('%0.0f bottle of beer on the wall, ',k)
    else %use proper grammar for the plural "bottles"
        fprintf('%0.0f bottles of beer on the wall, ',k)
    end %end if statement
    totalSum=totalSum+k;%add current bottles to toalSum
    fprintf('total %0.0f\n',totalSum)
    saveSums(k)=totalSum; %set kth term of saveSums to the current total sum
    saveDays(k)=k; %save an array that counts k
    hold on
    plot(k,totalSum,'xb')
    title('Drinking Beer')
    xlabel('Day')
    ylabel('Total Bottles')
end %end for loop

%Plot the line on the same graph
hold on
plot(saveDays,saveSums)

%print out the total number of bottles from the totalSum variable
fprintf('Total number of bottles is: %0.0f after %0.0f loops\n',totalSum,k)
