function [n_iterations, root] = my_root_newtonraphson(f, df, r0, tolerance)
% Numerically "solve" f(r)=0 for r starting with the initial 
% guess r0 using the Newton-Raphson method until 
% abs(f(r)) <= tolerance. df is the derivative of f. 
% f and df are function handles.
    root = r0; 
    n_iterations = 0;
    while abs(f(root)) > tolerance 
        root = root - f(root)/df(root); 
        n_iterations = n_iterations+1;
    end
end