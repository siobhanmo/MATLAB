function [a, p_error] = my_regression_perror(x_data, y_data, p, tolerance)
% x_data and y_data are two m × 1 arrays of class double that represent two-dimensional data. In other words, these column vectors represent a set of points of coordinates (x_data(i), y_data(i)), i = {1, 2, . . . , m}. You can assume that m > 1, and that all elements of x_data and y_data are di?erent from NaN, Inf, and -Inf. x_data and y_data represent the x- and y-data (respectively) to which we try to ?t the line of equation y = ax.
% p is a scalar of class double that represents p in Equation 8. p is an even integer that is greater than zero.
% tolerance is a scalar of class double that represents a positive number. See below for a more detailed description.
% a is a scalar of class double that represents the number a such that the p-error corre-sponding to ?tting the line of equation y = ax is minimum.
% p_error is a scalar of class double that represents the p-error Ep corresponding to the value of a calculated by your function.
    a1 = sum(x_data.*y_data) / sum(x_data.*x_data);
    f = @(a) sum((x_data*p) .* (((a*x_data)-y_data).^(p-1)));
    df = @(a) sum((p*(p-1)*((x_data).^2)).*((a*x_data - y_data).^(p-2)));    
    root = a1;
    while abs(f(root)/df(root)) > tolerance 
        root = root - f(root)/df(root);
    end
    a=root;
    if p==2
        a=a1;
    end
    p_error = sum((a*x_data-y_data).^p);
end