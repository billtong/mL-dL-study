clc
clear all

source = [1, 1, 1, 2, 2, 2, 2, 8];
target = [3, 4, 2, 6, 5, 7, 8, 9];
names = {'A', 'B', 'C', 'D', 'E', 'F', 'Zhiyuan', 'H', 'I'};
weights = [200, 300, 900, 400, 0, 8, 100, 50];
G1 = graph(source, target, weights, names);

figure
plot(G1, 'EdgeLabel', G1.Edges.Weight)