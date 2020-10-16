function[means, dim, sn, dn] = nbc(digits_train)
    dim = size(digits_train, 1);% image vector dimension
    sn = size(digits_train, 2); % sample number
    dn = size(digits_train, 3); % digits

    % normalize the vectors
    my_digits_train = normalizer(digits_train);

    % Binarize data
    my_digits_train = my_digits_train > 0.5;

    % calculate means
    means = mean(my_digits_train, 2);
end
