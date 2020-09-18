%% for loop and if else selection
tic
for i = 1:3
    if (i == 1)
        fprintf("This is the %d st loop\n", i)
    elseif (i == 2)
        fprintf("This is the %d st loop\n", i)
    else
        fprintf("This is the %d st loop\n", i)
    end
end
toc

%% while loop
a = 10;
while (a < 20)
    fprintf("value of a: %d\n", a)
end

%% others
clear       %% clear all variables in the memory
clc         %% clear the command window
doc plot    %% open documentation of function ’plot’
pwd         %% identify the current directory
dir         %% list files and directories in the current directory
cd newDir   %% change the current directory to the newDir
