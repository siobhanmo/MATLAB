function [result] = my_generic_integral(f, a, b, n, method)
%f is a function handle that represents a real-valued function f de?ned on R. f takes a single input argument that is an array of class double of arbitrary size (the “x values”), and outputs a single output argument that is an array of class double of the same size (the corresponding “y values”).
% a and b are two scalars of class double that represent a and b in Equation 4, respectively. You can assume that a and b are di?erent from NaN, Inf, and -Inf, and that a < b.
% n is a scalar of class double that represents a non-in?nite integer that is greater than zero. This number is the number of sub-intervals you should use when using numerical integration methods to approximate the value of the integral. All these sub-intervals should have the same width.
% method is a row vector of class char (i.e. a character string) that describes the numerical method to use to estimate the value of the integral. It can take one of the following values:
% ’riemann’. In this case, use the Riemann integral technique. On each sub-interval, use the value of the function at the left boundary of the sub-interval to approximate the value of the function to integrate.
 %’midpoint’. In this case, use the midpoint rule.  ’trapezoid’. In this case, use the trapezoid rule.  ’simpson’. In this case, use Simpson’s rule. • result is the value of
x = ( b -a)/n;
result=0;

if strcmp(method,'midpoint')
   for i= a+(x/2):x:b-(x/2)
       result=result+f(i)*x;
   end
end
if strcmp(method,'riemann')
   for i= a:x:b-(x)
       result=result+f(i)*x;
   end
end
if strcmp(method,'trapezoid')
   for i= a:x:b-(x)
       result=result+((f(i)+f(i+x))/2)*x;
   end
end
if strcmp(method,'simpson')
   if mod(n,2)~=0
       result=NaN;
   else
       dx=a:x:b;
       result = (f(dx(1))+sum(f(dx(3:2:end-2)))*2+ 4*sum(f(dx(2:2:end)))+f(dx(end)))*(x/3);
   end
end
end