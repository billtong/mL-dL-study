function y = activation(alpha) 
    %Finish the following line of code to compute the logistic 
    %activation function. 
    %Remember the logistic function is: y = 1/(1+exp(-alpha)) 
    %Here both alpha and y are vectors and they have the same size. 
    %You need to perform logistic activation on each element of alpha
    %and save the result in the corresponding element in y.
    %You can use for-loop to do so but you can also write your solution 
    %in only one line!!
    y = 1./(1+exp(-alpha));
end