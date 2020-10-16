function[means, sigma, dim, sn, dn] = cgc(digits_train)
    dim = size(digits_train, 1);% image vector dimension
    sn = size(digits_train, 2); % sample number
    dn = size(digits_train, 3); % digits

    % normalize the vectors
    norm_digits_train = normalizer(digits_train);

    % calculate the means
    means = mean(norm_digits_train, 2);

    sum_value = 0;
    % find the variances
    for i = 1 : dn
        for j = 1 : sn
            temp = sum((norm_digits_train(:, j, i) - means(:, i)).^2);
            sum_value = sum_value + temp;
        end
    end

    sigma_square = sum_value / (dim * sn * dn);
    sigma = sqrt(sigma_square);
end