% Matrix Basics
%{
useful short cuts:
comment: CTRL + R
uncomment: CTRL + T
%}
A = [1, 2; 3, 4];   %% ',' means same rows, ';' change to a new row
% 1     2
% 3     4

B = [-1; -2];
% -1
% -2

% A(2, 1);          %%() means indexing(get elements with coordinates)

% A(1, :), A(:, 1); %%Slice, get rows and cols

size(B), length(B) %%get matrix size

% B';               %%transpose

% [A B]              %% concatenate two matrix in column
% 1     2    -1
% 3     4    -2

C = [A; B'];        %% concatenate two matrix in row
% 1     2
% 3     4
% -1    -2

diag(A)            %% diagonal part of A
% 1
% 4

triu(A), tril(A)   %% triangle part of A, u for upper, l for lower
% 1     2  |   1     0
% 0     4  |   3     4

reshape(A, 1, 4)   %% reshape A to size [1,4]
% 1     3     2     4

repmat(A, 1, 2)     %% repeat matrix A 1 times in row, 2 times in col
%  1     2     1     2
%  3     4     3     4

repelem(B, 1, 2)    %% repeat elements several times along the given axis

% doc repelem         %% open documentaion of funciton 'repelem'
