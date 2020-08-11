function [coefficients, e2] = my_regression_generic(x_data, y_data, f)
% x_data and y_data are two m × 1 arrays of class double that represent two-dimensional data. In other words, these column vectors represent a set of points of coordinates (x_data(i), y_data(i)), i = {1, 2, . . . , m}. You can assume that m > 1, and that all elements of x_data and y_data are di?erent from NaN, Inf, and -Inf.
% f is a 1 × n cell array that contains function handles that represent the fi’s of Equation 3 (f{i} represents fi). Each of these function handles takes a single input argument that is an array of class double of any size (and whose elements are di?erent from NaN, Inf, and -Inf), and outputs a single output argument that is an array of class double of the same size as the input array (and whose elements are also di?erent from NaN, Inf, and
% -Inf). You can assume that n > 0.
% coefficients is a n × 1 array of class double that represents the ai’s of Equation 3 (a(1)
% represents ai), ?tted to the x- and y-data represented by x_data and y_data (respectively), using least-squares linear regression.
% e2 is the square error associated with the linear regression performed by the function.
    [~,n] = size(f);
    [m,~] = size(x_data);
    x_fun = [];
    e2=0;
    for i=1:m
        for j=1:n
           x_fun(i,j) = arrayfun(f{j},x_data(i)); 
        end
    end
    coefficients = pinv(x_fun)*(y_data); 
    [r,c] = size(coefficients);
    
    e2 = (sum(x_fun(1:r,1:c).*coefficients)- sum(y_data(1:r,1:c))^2);   
    
end