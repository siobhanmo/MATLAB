function [coefficients] = my_regression_polynomial(x_data, y_data, degree_min, degree_max)
% x_data and y_data are two m × 1 arrays of class double that represent two-dimensional data. In other words, these column vectors represent a set of points of coordinates (x_data(i), y_data(i)), i = {1, 2, . . . , m}. You can assume that m > 1, and that all elements of x_data and y_data are di?erent from NaN, Inf, and -Inf.
% degree_min and degree_max are scalars of class double that represent integers that are greater than zero, and such that degree_min degree_max.
% coefficients is a (p+1)×1 array of class double such that degree_min<= p<= degree_max.
   % The elements of coefficients are the coe?cients of a polynomial of degree p (coefficient(i) represents ai?1 in Equation 6). 
   % This polynomial should be the polynomial that best ?ts, using least-squares linear regression, such that:
   % p is as small as possible
   % the magnitude of the square error of degree p + 1 instead of a polynomial of degree p is less than 10% of the square error associated with ?tting a polynomial of degree p.
   e1=1;
   e2=2;
   p=degree_min;
   p_temp = 0;
   m=[];
   m2=[];   
   coefficients=[];
   
   while ~(abs((e1-e2)/e1) < (.1)) && p < degree_max
       e1=0;
       e2=0;
       while(p_temp<=p)
           m = [m,arrayfun(@(x) x^p_temp,x_data)];
           p_temp = p_temp+1;
       end
       p_temp=0;
       while(p_temp<=p+1)
           m2 = [m2,arrayfun(@(x) x^p_temp,x_data)];
           p_temp = p_temp+1;
       end
       
       coefficients = pinv(m)*(y_data);
       coef = pinv(m2)*(y_data);
       
       e1= sum((m*coefficients - y_data).^2);
       e2 = sum((m2*coef - y_data).^2);
       
       p=p+1;
       p_temp=0;
       m=[];
       m2=[];
   end
end
       