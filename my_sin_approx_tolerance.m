function [approx, n] = my_sin_approx_tolerance(x, tolerance)
% x (scalar, double) is value of x in Equation 2. You can assume that x is neither NaN, Inf, nor -Inf.
% tolerance (scalar, double) is greater than zero and that is neither NaN nor Inf.
% n (scalar, double)is smallest possible value s.t. approx of sin(x) is w/in tolerance of the value calculated by Matlab.
% approx (scalar, double) is approximation of sin(x) as calculated by Equation 2.
b = sin(x);
n = -1;
approx = 0;
while ~(abs(approx - b) <= tolerance)
    n = n + 1;
    approx = approx + ((-1)^(n) * (x)^(2*n + 1)) / factorial(2*n + 1);
end %n is sufficient to fulfill tol, returns n and approx
end