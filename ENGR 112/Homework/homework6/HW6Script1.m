%Andrew Brown Homework 6 Problem 1

clc
clear
close all

%Practice reading files and using polynomial functions

hot=dlmread('HotLiquid.txt'); %read hotliquid.txt
cold=dlmread('Ice.txt'); %read ice.txt

legendLabel={'Deg 1 Polynomial','Deg 2 Polynomial','Deg 3 Polynomial','Deg 4 Polynomial'}; %legend labels
for i=1:4
    P=polyfit(hot,cold,i); %create polynomials of varying degrees
    polyFunc=@(hot) polyval(P,hot); %evaluate the polynomials at the given values of hot
    subplot(4,1,i) %make subplots
    plot(hot,cold,'rx'); %plot original data points
    hold on
    fplot(polyFunc,'k','Linewidth',1) %plot your x values (hot) vs the evaluated polynomial functions
    axis([1,5,0,1000]) %define axes
    xlabel('Volume of hot liquid (cups)') %define x label
    ylabel('Volume of Ice (cups)') %define y label
    legend('Data Points',legendLabel{i}) %define legend
    if i==2 %print out the volume of ice needed to chill 1.5 cups of hot liquid for the 2nd degree polynomial
        fprintf('The volume of ice needed to chill 1.5 cups of hot liquid is %0.0f cups\n', polyFunc(1.5))
    end
end


