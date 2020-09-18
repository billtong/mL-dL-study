str = "Hello";      %% create a string
% str == "Hi";      %% compare(use "" for string, ''for char)
% 0

% str == "Hello";
% 1

func = @mean;    %% function handle
func([1, 2]);    %% (make it easy to pass function as parameter)   
% 1.5000        %% use the handle

fprintf("int %d, double %.2f", 1, 2); % print
disp("Hi")  % display message of varibales
disp(str)