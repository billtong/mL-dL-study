clear
load('a1digits.mat')

% Get the size of the training and test set
% image_vector_dim (1, 1) , sample_num (1, 2), digits (1, 3)
train_size = size(digits_train);
test_size = size(digits_test);

sn = train_size(1, 2);
dn = train_size(1, 3);

num = randperm(sn, 1);

for i = 1 : dn
    reshaped_vector = reshape(digits_train(:, num, i), 8, 8)';
    subplot(1, dn, i);
    imagesc(reshaped_vector); 
    axis equal; 
    axis off; 
    colormap gray;
    title(i)
end
