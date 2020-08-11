function [coefficients_d] = my_d_polynomial(coefficients, k)
%coefficients is a 1 × (n + 1) array of class double that represents the coe?cients an, an?1, . . . , a0 (in this order) of a real polynomial P of degree n or lower, as given by Equation 9. You can assume that n 0 and that all the elements of coefficients are di?erent from NaN, Inf, and -Inf.
% k is a scalar of class double that represents an integer that is greater than or equal to 0.
% coefficients_d is a 1 × (n + 1) array of class double that represents the coe?cients an, an?1, . . . , a0 (in this order) of the polynomial P(k), as given by Equation 9. P(k) is the
% kth derivative of P. Note that P(0) = P (i.e. the 0th derivative of P is P itself).
    [~,m] = size(coefficients);
    m=m-1;
    p = m;  
    m1 = m;
    t=0;
    coeff = zeros(size(coefficients));
    if k==0
        coefficients_d = coefficients;
    elseif k > m+1
        coefficients_d = coeff;
    else
    for i=1:k
        for j=1: m1
            coeff(j+1+t) = coefficients(j+t)*p;             
            p=p-1;
        end
        coefficients = coeff;        
        coeff = zeros(size(coefficients));
        p=m1-1;
        t = t+1;
        m1=m1-1;
    end
    coefficients_d=coefficients;
    end
    
end