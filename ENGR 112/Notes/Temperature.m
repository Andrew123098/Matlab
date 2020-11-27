clc
clear

tempC=input('What is the temperature in Celcius:');
tempF=(tempC*(9/5)+32);
if(tempC<25)
    fprintf('Hello World! It is chilly outside!\n')
else
    fprintf('Hello World! It is warm outside!\n')
end
fprintf('The temperature is %0.2f C or %0.2f F\n',tempC,tempF)