function [coefficients] = my_lagrange(x_data, y_data)
% x_data and y_data are two m × 1 arrays of class double that represent two-dimensional data. In other words, these column vectors represent a set of points of coordinates (x_data(i), y_data(i)), i = {1, 2, . . . , m}. 
     % You can assume that m > 1, that all the elements of x_data and y_data are di?erent from NaN, Inf, and -Inf, 
     % the ele-ments of x_data are di?erent from each other and sorted in increasing order.
% coefficients is a (m + 1) × m array of class double that represents the Lagrange basis polynomials and the Lagrange polynomial corresponding to the x- and y-data represented by x_data and y_data, respectively. 
     % Each row of coefficients represents the coe?cients of a polynomial of degree (m ? 1) or lower i.e. the coe?cients a0, a1, ..., am?1 of this polynomial (see Equation 4), in this order. The ?rst row of coefficients represents the polynomial l1, the second row of coefficients represents the polynomial l2, and so on. The last row of coefficients represents the Lagrange polynomial.
    [m,~] = size(x_data);
    b = eye(m,m);
    a = zeros(m,m);
    for i=1:m
        for j=1:m
           a(i,j) = x_data(i)^(j-1);
        end
    end
    coefficients = [transpose(a\b);transpose(a\y_data)];
end