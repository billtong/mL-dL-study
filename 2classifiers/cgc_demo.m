%Conditional Gaussian Classifier
clear
load('a1digits.mat')

%perform conditional Gaussian Classify
[means, sigma, dim, sn, dn] = cgc(digits_train);

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
str = "means uk display above, Pixel Noise Standard Deviation =" + sigma;
annotation("textbox",[.3 .3 .6 .5], "String", str, "EdgeColor", "none")
