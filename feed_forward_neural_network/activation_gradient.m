function gradient = activation_gradient(y)
    %Finish the following line of code to compute gradient for 
    %the logistic activation function.
    %Remember logistic function is: y = 1/(1+exp(-alpha)) 
    %so you need to compute d(y)/d(alpha).
    %remember that:
    %  (1) d(y)/d(alpha) can be expressed in terms of y
    %  (2) here y is a vector, so you need to compute gradient with regard
    %      to each of element in y; you can use for-loop to do so but you can
    %      also write your solution in only one line!!
    %  (3) you need to save your result in a vector "gradient" 
    %      which has the same size as y.
    gradient = y.*(1-y);
end