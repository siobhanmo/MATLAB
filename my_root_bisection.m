function [n_iterations, root] = my_root_bisection(f, a, b, tolerance)
% Numerically "solve" f(r)=0 for r over the interval [a,b] 
% using the bisection method until abs(f(r)) <= tolerance. 
% This implementation assumes that f is continuous and that 
% f(a)*f(b) <= 0. % f is a function handle.
    n_iterations = 1;
    root = (a+b) / 2; 
    while abs(f(root)) > tolerance 
        if f(a)*f(root) <= 0
            b = root; 
        else
            a = root; 
        end
        root = (a+b) / 2; 
        n_iterations = n_iterations+1;
    end
end