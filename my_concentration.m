function [c] = my_concentration(q, u, s, x, y)
% q is the emission rate of the pollutant of interest per unit length of the road. In this question, we assume that this quantity is constant.
% ?y and ?z describe the intensity of pollutant dispersion in the y- and z-directions, respec-tively. The z-direction is the vertical direction. These quantities depend on atmospheric conditions. In this question, we assume the atmosphere to be moderately unstable. In this case, ?y and ?z can be estimated as (Seinfeld and Pandis, 2006):
%?y(x) = exp(?1.634 + 1.0350 ln(x) ? 0.0096 ln2(x)) (8) ?z(x) = exp(?1.999 + 0.8752 ln(x) + 0.0136 ln2(x)) (9)
%where x, ?y, and ?z are in units of meters.
% ? is the integration variable. The integral in Equation 7 represents the summation (over each location ? along the road segment) of the contributions to air pollution of in?nitesi-mally small sections of the road segment.
sigmaz = exp(.0136*log(x)^2-1.999+.8752*log(x));
sigmay = exp(-1.634+1.035*log(x)-.0096*log(x)^2);
f = @(w) exp(-(y-w)^2/(2*sigmay^2))* (q/(pi*u*sigmay*sigmaz));

b=s/2;
a=-s/2;
n=100;
width=(b-a)/n;
r=0;

for i= a+(width/2):width:b-(width/2)
       r=r+f(i)*width;
end
c=r;

end