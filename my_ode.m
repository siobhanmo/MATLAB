function [t, y_numerical, y_analytical, rmse] = my_ode(tf, y0, n, method)
%tf is a scalar of class double that represents the ?nal time tf .
% n is a scalar of class double that represents the number of equally-spaced time steps to use when numerically solving the ordinary di?erential equation on the interval [t0, tf ] (t0
    %and tf included). You can assume that n > 1.
% method is a row vector of class char (i.e. a character string) that can take one of the following four values:
    %’euler’: in this case, use the explicit Euler method.  ’midpoint’: in this case, use the midpoint method.  ’rk4’: in this case, use the fourth-order Runge-Kutta method.  ’ode45’: in this case, use Matlab’s built-in function ode45, forcing this function to
    %calculate the numerical solution at times t as de?ned below, as opposed to letting this function determine the sizes of the time steps to take.
% t is an 1 × (n + 1) array of class double that represents, in increasing order, the equally-spaced points in the interval [t0, tf ] used when numerically solving the ordinary di?erential equation.
% y_numerical is 1 × (n + 1) array of class double that represents the values of the function y at times t (in the same order) as approximated by the numerical solver.
% y_analytical is 1×(n+1) array of class double that represents the values of the function y at times t (in the same order) as calculated using the analytical solution.
% rmse is a scalar of class double that represents the root mean square error between the numerical solution and the analytical solution.
    t0 = 0;
    f = @(t,y) t*exp(-t) - y;
    if strcmp(method, 'euler')
        [t, y_numerical] = my_explicit_euler(f, t0, tf, y0, n);
    elseif strcmp(method, 'midpoint')
        [t, y_numerical] = my_midpoint(f, t0, tf, y0, n);
    elseif strcmp(method, 'rk4')
        [t, y_numerical] = my_rk4(f, t0, tf, y0, n);
    elseif strcmp(method, 'ode45')
        [t, y_numerical] = ode45(f,linspace(t0,tf,n+1),y0);
        y_numerical = y_numerical';
    end
    y_analytical = zeros(1,n+1);
    for i=1:n+1
    y_analytical(i) = exp(-t(i))*( (t(i)^2)/2 + y0);
    end
    rmse = sqrt((1/(n+1))*sum((y_numerical-y_analytical).^2));

end