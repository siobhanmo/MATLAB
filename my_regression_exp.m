function [a, lambda] = my_regression_exp(x_data, y_data)
%x_data and y_data are two m × 1 arrays of class double that represent two-dimensional data. In other words, these column vectors represent a set of points of coordinates (x_data(i), y_data(i)), i = {1, 2, . . . , m}. You can assume that m > 1, and that all elements of x_data and y_data are di?erent from NaN, Inf, and -Inf. Additionally, you can assume that all the elements of y_data are positive.
% a and lambda are scalars of class double that represent a and ? in Equation 5, respectively, ?tted to the x- and y-data represented by x_data and y_data (respectively), using least-squares linear regression.
    m = [(x_data), ones(size(x_data))];
    y = arrayfun(@(y) log(y), y_data);
    c = pinv(m)*y;
    
    a = exp(c(2));
    lambda = (-1)/(c(1));    
end
