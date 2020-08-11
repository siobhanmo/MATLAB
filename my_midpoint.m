function [t, y] = my_midpoint(f, t0, tf, y0, n)
% f is a function handle that represents F in Equation 1. The corresponding function takes two input arguments (scalars of class double): the time t and the value of the function y
     % at time t, respectively, and returns one output argument (a scalar of class double): the value of F(t, s).
% t0 and tf are scalars of class double that represent the initial time t0 and ?nal time tf , respectively.
% y0 is a scalar of class double that represents the value of the function y at time t = t0.
% n is a scalar of class double that represents the number of equally-spaced time steps in the interval [t0, tf ] (t0 and tf included) to use for the explicit Euler method. You can assume that n > 1.
% t is an 1 × (n + 1) array of class double that represents, in increasing order, the equally-spaced points in the interval [t0, tf ] used for the explicit Euler method.
% y is 1 × (n + 1) array of class double that represents the values of the function y at the times t (in the same order) as approximated by the explicit Euler method.
    t = linspace(t0,tf,n+1);
    y = zeros(size(t));
    y(1) = y0;
    for i=1: length(t)-1
        x= t(i) + (t(i+1)-t(i))/2;
        y1 = y(i) + f(t(i), y(i))*(t(i+1)-t(i))/2;
        y(i+1) = y(i)+ f( x , y1 )*(t(i+1)-t(i));
    end 

end