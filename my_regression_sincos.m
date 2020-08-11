function [k, a, b] = my_regression_sincos(x_data, y_data, n)
% x_data and y_data are two m × 1 arrays of class double that represent two-dimensional data. In other words, these column vectors represent a set of points of coordinates (x_data(i), y_data(i)), i = {1, 2, . . . , m}
% n is a scalar of class double that represents n in Equation 4. You can assume that n is an integer such that n > 0.
% k is a scalar of class double that represents k in Equation 4. 
% a and b are n × 1 arrays of class double such that a(i) represents ai in Equation 4 and b(i) represents bi in Equation 4.
    
    Ms = ones(numel(x_data),n);
    Mc = ones(numel(x_data),n);
    
    for i=1:n
        for j=1:numel(x_data)
            Ms(j,i)= sin(i * x_data(j));
            Mc(j,i)= cos(i * x_data(j));
        end
    end
    
    m = [ones(size(x_data)),Ms, Mc]; 
    coefficients = pinv(m) * y_data;
    for i=1:n         
        b(i,1) = coefficients(1+n+i); 
        a(i,1) = coefficients(1+i);
    end    
    k = coefficients(1);
    
end