clc
clear

a=[1,2,3,4;1,4,9,16;1,16,81,256];
A=ones(3,4);
for i=1:4
    A(1,i)=i;
    for j=2:3
        A(j,i)=A(j-1,i)^2; 
    end
end
disp(A)
disp(a)