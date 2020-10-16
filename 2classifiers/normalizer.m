function [digits] = normalizer(digits)
    data_size = size(digits);
    sn = data_size(1, 2); % sample number
    dn = data_size(1, 3); % digits
    for i = 1 : dn
        for j = 1 : sn
            max_num = max(digits(:, j, i));
            min_num = min(digits(:, j, i));
            digits(:, j, i) = (digits(:, j, i) - min_num) / max_num;
        end
    end
end