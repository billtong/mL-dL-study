A = [1, 2; 3, 4];
B = [-1, -2; -3, -4];
c = [1, 2]';

% A + B %% matrix of the same size, add, minus is also the same
%  0     0
%  0     0

% A * c %% matrix dot product
%  5
% 11

% A .* B %% element wise product
% -1    -4
% -9   -16

% A + c %% matrix add with different shape, broadcast C
%  2     3
%  5     6

% A .* c %% element wise product with different shape, broadcast C
%  1     2
%  6     8

% d = A * c
% A \ d %% famous matlab left division, solve A^-1 d
%  1
%  2

% c.^2, sqrt(c) %% element wise sqaure/ square root
%  1  |   1.0000
%  4  |   1.4142

sum(c), prod(c) %% sum and product
% 3 |   2

mean(A, 2) %% mean over particular dimension
% 1.5000
% 3.5000

max(A), min(A) %% maximum and minimum, along certain dim also supported
% 3     4   |   1   2

maxk(A, 2) %% top 2 largest element
%  3     4
%  1     1

find(c == 2) %% find elements, return index(first? last? all?)
% 2
