%Andrew Brown Homework 7 Problem 1

clc
clear

%Solve Caesar Ciphers

text=dlmread('shifts.txt'); %read the caesar shift data
alphabet='ABCDEFGHIJKLMNOPQRSTUVWXYZ'; %index the alphabet

%read, adjust, compute, and print out the plaintext of the given ciphertext
for i=1:3
    if i==1 %using caesar1.txt
        code1=dlmread(strcat('caesar',num2str(i),'.txt')); %store the given file as a variable
        code1=code1-65; %adjust for ASCII shift
        N1=mod((code1+text(i)),26); %compute proper numbers using given formula
        string1=alphabet(N1+1); %change numbers to text via indices shifted b/c A=0
        fprintf(strcat('String 1:\n',string1,'\n')) %print the decrypted plaintext
    elseif i==2 %using caesar2.txt
        code2=dlmread(strcat('caesar',num2str(i),'.txt')); %store the given file as a variable
        code2=code2-65; %adjust for ASCII shift
        N2=mod((code2+text(i)),26); %compute proper numbers using given formula
        string2=alphabet(N2+1); %change numbers to text via indices shifted b/c A=0
        fprintf(strcat('String 2:\n',string2,'\n'))  %print the decrypted plaintext
    elseif i==3 %using caesar3.txt
        code3=dlmread(strcat('caesar',num2str(i),'.txt')); %store the given file as a variable
        code3=code3-65; %adjust for ASCII shift
        N3=mod((code3+text(i)),26); %compute proper numbers using given formula
        string3=alphabet(N3+1); %change numbers to text via indices shifted b/c A=0
        fprintf(strcat('String 3:\n',string3,'\n')) %print the decrypted plaintext
    end
end
