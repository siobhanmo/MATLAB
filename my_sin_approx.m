function [exact, approx, actual_error, relative_error] = my_sin_approx(x)
% x is a double
% exact is from matlab sine function
% approx is the approximated value
% actual error is approx-exact
% relative is actual/exact
    exact = sin(x);
    approx = x - ( (x^3) / factorial(3) ) + ( (x^5) / factorial(5) ) - ( (x^7) / factorial(7) );
    actual_error = approx - exact;
    relative_error = (actual_error / exact); 
end
    