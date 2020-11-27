% Andrew Brown Lab 3 Problem 2

clc
clear
clf

%How to save values you calculate in your for loops so you can plot them
%later

%Define given variables
totalSum=0;
n=10;
saveSums=zeros(1,length(n));
saveDays=zeros(1,length(n));

%For loop counting from 1 to 10 going up
for k=1:n
    if k==1 %use proper grammar for the first bottle
        fprintf('%0.0f bottle of beer on the wall\n',k)
    else %use proper grammar for the plural "bottles"
        fprintf('%0.0f bottles of beer on the wall\n',k)
    end %end if statement
    totalSum=totalSum+k;%add current bottles to toalSum
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
fprintf('Total number of bottles is: %0.0f\n',totalSum)
