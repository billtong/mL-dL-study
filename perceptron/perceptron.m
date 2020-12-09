function [w, b, h_w, h_b, upd_ind] = perceptron(X, t, eta)
% input:
% X: feature matrix
% t: true labels
% eta: learning rate
% output:
% w: learned weights 
% b: learned bias
% h_w: save all history values of weights (used for plotting figures) 
% h_b: save all history values of bias (used for plotting figure)
% upd_ind: save all indexes of datapoints visited (used for plotting figure)

% Initialize weights
[N, dim] = size(X);
w = rand(dim, 1); %weights 
b = 0.05; %bias

error = N;
count = 0;  %counts of datapoints being visited
h_w = zeros(dim, 10000); 
h_b = zeros(1, 10000); 
upd_ind = zeros(1, 10000);

% start the training loop
while (error > 0) 
    error = 0;
    for n = 1:N
        x = X(n, :)'; % get the (x,y, ...) of variable X[n]

        % Using the current w, b to predict the label for x
        % yi(w*xi+b)
        pred_label =w' * x + b;
        
        % If a misclassified point is found, update weights and bias
        % also, update the number of errors (i.e., update the variable "error")
        if pred_label * t(n) <= 0
            
            w = w + eta * t(n) * x;
            b = b + eta * t(n);
            count = count - 1;
            error = error + 1;
        end
        
        % store current parameters for later visualization
        count = count + 1;
        h_w(:, count) = w;
        h_b(1, count) = b;
        upd_ind(1, count) = n;
    end
end

% discard unused space
h_w = h_w(:, 1:count);
h_b = h_b(:, 1:count);
upd_ind = upd_ind(:, 1:count);

fprintf("Zero Error Achieved, Training Stop!")

end
