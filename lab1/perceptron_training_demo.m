%% prepare the data
%data1 = mvnrnd([3, 0], [0.9, 0.2; 0.2, 0.7], 30);
%data2 = mvnrnd([0, 3], [0.8, 0.3; 0.3, 1.2], 30);


%X = [data1; data2];
%y = repelem([1; -1], 30);
load("2d_points.mat")

hold on
plot(X(1:30, 1), X(1:30, 2), 'ro')
plot(X(31:60, 1), X(31:60, 2), 'b.')


%% get trained parameters w, b and the history value w_h, b_h
%rng(425)
rng(225)    %% random seed generated
% training 
[w, b, h_w, h_b, ind] = perceptron(X, y, 0.005);


% visualization
n = length(h_b); 

for i = 1:n
%    disp(i)
    w = h_w(:, i);
    b = h_b(i);
    x = (-20):20;
    
    hold off
    plot(X(1:30, 1), X(1:30, 2), 'ro')
    hold on
    plot(X(31:60, 1), X(31:60, 2), 'b.')
    plot(X(ind(i), 1), X(ind(i), 2),'k*' )
    line(x, (-b - w(1) * x)./w(2))
    axis([-2, 4, -2, 4])
    drawnow
    
    pause(0.1)
end



