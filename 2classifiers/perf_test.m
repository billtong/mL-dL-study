%% performance test
% preparement
clear
load('a1digits.mat')

sn_t = size(digits_test, 2);

%% Gaussian Classify Performance test
%perform conditional Gaussian Classify
[means, sigma, dim, sn, dn] = cgc(digits_train);
test_record1 = zeros(10, 2);
for i = 1 : dn
    c = zeros(1, 10);
    for j = 1 : sn_t
        temp = zeros(1, dn);
        for k = 1 : dn
            % estimate the probabilities
            temp2 = exp(-sum((digits_test(:, j, i) - means(:, k)).^2));
            temp(k) = temp2;
        end
        max_index = find(temp==max(temp));
        c(max_index) = c(max_index) + 1;
    end
    test_record1(i, 1) = sn_t - c(i);
    test_record1(i, 2) = (sn_t - c(i)) / sn_t;
end

    avg_recourd1 = mean(test_record1);

%% Naive Bayes Performace test
%perform naive bayes classify
[means, dim, sn, dn] = nbc(digits_train);

test_record2 = zeros(10, 2);

for i = 1 : dn
    c = zeros(1, 10);
    for j = 1 : sn_t
        temp = zeros(1, dn);
        for k = 1 : dn
            % estimate the probabilities
            temp2 = 1;
            for z = 1 : dim
                temp2 = temp2 * (means(z, k).^(digits_test(z, j, i))) * ((1 - means(z, k)).^(1 - digits_test(z, j, i))); 
            end
            temp(k) = temp2;
        end
        max_index = find(temp==max(temp));
        c(max_index) = c(max_index) + 1;
    end
    test_record2(i, 1) = sn_t - c(i); %error number
    test_record2(i, 2) = (sn_t - c(i)) / sn_t; % error percentage
end

    avg_recourd2 = mean(test_record2);


