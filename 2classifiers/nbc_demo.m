% naive bayes classifier display nk in plot
clear
load('a1digits.mat')

%perform naive bayes classify
[means, dim, sn, dn] = nbc(digits_train);

%draw plot
for i = 1 : dn
    reshaped_vector = reshape(means(:, i), 8, 8)';
    subplot(5, dn, i, 'align');
    imagesc(reshaped_vector); 
    axis equal; 
    axis off; 
    colormap gray;
    title(i)
end
str = "Naive Bayes means nk display above";
annotation("textbox",[.3 .3 .6 .5], "String", str, "EdgeColor", "none")