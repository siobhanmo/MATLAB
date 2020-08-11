function [volume] = my_solid_of_revolution(f, a, b, n)
% f is a function handle that represents the real-valued function f in Equation 6. This function is de?ned on [a, b] and represents the pro?le of the solid of revolution. f takes a single input argument that is an array of class double of arbitrary size (the “x values”), and outputs a single output argument that is an array of class double of the same size (the corresponding “y values”). You can assume that all values returned by f are greater than or equal to zero.
% a and b are two scalars of class double that represent a and b in Equation 6, respectively. You can assume that a and b are di?erent from NaN, Inf, and -Inf, and that a < b.
% n is a scalar of class double that represents a non-in?nite integer that is greater than zero. This number is the number of sub-intervals you should use when using a numerical integration method to approximate the value of V . All these sub-intervals should have the same width.
% volume is a scalar of class double that represents the volume V of the solid as approximated by the trapezoid rule applied to Equation 6.
result=0;
w=(b-a)/n;
for i =a:w:b-w
    result=result+((f(i)^2+f(i+w)^2)/2)*w;
end
volume=result*pi;
end