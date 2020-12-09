%% please modify your working directory next line
clear % clear memory
load('a1digits.mat');


%% split training set to 200 validation set and 500 training set, so do the label
disp('Loading and Reformatting Data')
digits_val = digits_train(:, 501:700, :);
digits_train = digits_train(:, 1:500, :);

% k-nearest neighbour classifer
% first reshape the data to standard format D*d matrix
% row -- samples N
% col -- features d
% pay attention to the transpose sign ' here
train_digits = reshape(digits_train, 64, 500*10)';
val_digits = reshape(digits_val, 64, 200*10)';
test_digits = reshape(digits_test, 64, 400*10)';

% labels are ['1'*500, '2'*500, ..., '10'*500] a 5000*1 vector, so do
% validationa  and test labels
% pay attention to the transpose sign ' here
train_labels = repelem(1:10, 500)';
val_labels = repelem(1:10, 200)';
test_labels = repelem(1:10, 400)';


%% perform a k-nearest neighbour training,  predict validation set 
% support distance type:
% 'euclidean', 'squaredeuclidean', 'seuclidean', 'cityblock', 'chebychev',
% 'mahalanobis', 'cosine', 'correlation', 'hammering', 'user_define'

% for user_define distance function, pass a function handle @dist_func
% [pred, label, sample] = knn(querys, train_digits, train_labels, 10, 'user_define', @dist_func);
disp('Training and Validation!')
val_accuracy = [];
ks = [2, 3, 4, 5, 10, 20, 30, 50, 100];

% loop over ks, evaluate on validation set for each k
for k = ks
    tic

    % predict on the *validation* set and return the predicted label
        
    [pred, ~, ~] = knn(val_digits, train_digits, train_labels, k, 'euclidean');

    toc 
    
    % calculate and show accuarcy for this round of validation
    acc = sum(pred == val_labels)/length(val_labels);
    fprintf('The Overall Accuarcy on Validation Set Achieved with k = %d :   %.2f %%.\n\n', k, 100*acc);
    val_accuracy= [val_accuracy acc]; %#ok<AGROW>
end

% make a line plot on the results
plot(2:10, val_accuracy, '-o')
set(gca, 'XTickLabel',  {'1', '2', '3', '4', '5', '10', '20', '30', '50', '100'})
title('Accuracy on Validation Set')
ylabel('Accuracy') 
xlabel('Different Values of K') 


%% test the best model on test set
% find best k
disp('Testing!')
[best_acc, ind] = maxk(val_accuracy, 1);
best_k = ks(ind);
fprintf('Best k is : %d.\n', best_k);

% fit a knn model with our best k and predict on test set

% ******** step 1. ********
% please fit a knn model using training digits, and get predictions on
% test set, this should be only one line

% Again you need to write a line below to call our knn function to 
% apply the best k found on validation set on the test set. 
% You should return the "predicted label" (the first returned parameter
% of function knn)
% and save that to variable "pred" 
[pred, ~, ~] = knn(test_digits, train_digits, train_labels, best_k, 'euclidean');

% ******** step 2. ********
% once you get your prediction, please add one line of code to calculate 
% the accuracy
acc = sum(pred == test_labels)/length(test_labels);

% ******** step 3. ******** 
% Display the following content in the Command Window, 
% 'The final accuracy on test set is yyy %, which is obtained with k = xxx, where k is selected using a validation set.'
% xxx should be replaced by your best k, and yyy is the final accuracy on 
% the test set achieve by using your best k
fprintf('The Overall Accuarcy on Validation Set Achieved with k = %d :   %.2f %%.\n\n', best_k, 100*acc);
