%% please modify your working directory next line
clear % delete existing objects in memory
load('a1digits.mat');


%% format training and test dataset
% k-nearest neighbour classifer
% first reshape the data to standard format D*d matrix
% row -- samples N
% col -- features d
% pay attention to the transpose sign ' here
train_digits = reshape(digits_train, 64, 700*10)';
test_digits = reshape(digits_test, 64, 400*10)';

% labels are ['1'*500, '2'*500, ..., '10'*500] a 5000*1 vector
% pay attention to the transpose sign ' here
train_labels = repelem(1:10, 700)'; % repeat 700 times for int the row
test_labels = repelem(1:10, 400)';  % for validation



%% perform a k-nearest neighbour training,  predict validation set 
% support distance type:
% 'euclidean', 'squaredeuclidean', 'seuclidean', 'cityblock', 'chebychev',
% 'mahalanobis', 'cosine', 'correlation', 'hammering', 'user_define'

% for user_define distance function, pass a function handle @dist_func
% [pred, label, sample] = knn(querys, train_digits, train_labels, 10, 'user_define', @dist_func);
disp('Training and Testing your Digits Dataset')

tic
%return predicted label, label and sample index of its k nearest neighbor
[pred, k_min_label, k_min_sample] = knn(test_digits, train_digits, train_labels, 10, 'euclidean');
toc 

% calculate and show accuarcy
acc = sum(pred == test_labels)/length(test_labels);
fprintf('The Overall Accuarcy on Test Set Achieved with k = %d :   %.2f %%.\n\n', 10, 100*acc);

