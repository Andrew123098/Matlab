clc
clear all

%read the file into a matrix of data
filename = "test.txt";
data = dlmread(filename);

%person 1
pre1 = data(:,1);
post1 = data(:,2);

%person 2
pre2 = data(:,3);
post2 = data(:,4);

%person 3
pre3 = data(:,5);
post3 = data(:,6);

%person 4
pre4 = data(:,7);
post4 = data(:,8);

%person 5
pre5 = data(:,9);
post5 = data(:,10);

%person 6
pre6 = data(:,11);
post6 = data(:,12);


%run the ttests
%if H0 == to 0, then we cannot reject the null hypothesis
H0test1 = ttest2(pre1, post1);
H0test2 = ttest2(pre2, post2);
H0test3 = ttest2(pre3, post3);
H0test4 = ttest2(pre4, post4);
H0test5 = ttest2(pre5, post5);
H0test6 = ttest2(pre6, post6);
 

%difference between post and pre test 
differences = zeros(size(data,1),size(data,2));

for row = 1:size(data,1) 
        for col = 1:size(data,2)
            if mod(col,2) == 0 %only runs if even column number
               post = data(row, col);
               pre = data(row, col - 1);
               diff = post - pre;
               differences(row, col/2) = diff;
            end
        end
end

%test 1
music1 = differences(1,1:3);
bt1 = differences(1,3:6);

%test 2
music2 = differences(2,1:3);
bt2 = differences(2,4:6);

%test 3
music3 = differences(3,1:3);
bt3 = differences(3,4:6);

%test 4
music4 = differences(4,1:3);
bt4 = differences(4,4:6);

Ttest1 = ttest2(music1,bt1);
Ttest2 = ttest2(music2,bt2);
Ttest3 = ttest2(music3,bt3);
Ttest4 = ttest2(music4,bt4);

























