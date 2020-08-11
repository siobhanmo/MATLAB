function [approx] = my_sin_approx_fixed(x, n)
% x (scalar, double) is value of x in Equation 2. You can assume that x is neither NaN, Inf, nor -Inf.
% n (scalar, double) is value of n in Equation 2. You can assume that n is either zero or a positive integer.
% approx (scalar, double) that represents the approximation of sin(x) according to Equation 2.
    approx = 0;
    for i=0:n
        approx = approx + ((-1)^(i) * (x)^(2*i + 1)) / factorial(2*i + 1);
    end
end