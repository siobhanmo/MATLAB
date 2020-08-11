function [e2, r2] = my_regression_metrics(y_data, y_predicted)
% y_data (m × 1) is an array whose elements are di?erent from NaN, Inf, and -Inf. You can assume that m > 1.
% y_predicted (m × 1) is an array that represents y-values as predicted by an approximation method (e.g., least-squares linear regression). 
       % Each element is an estimation of the corresponding element in y_data (y_predicted(i)corresponds to y_data(i))
% e2 (sc,d) represents the square error E2 associated with using the values of y_predicted in lieu of the values of y_data.
% r2 (sc,d) represents the coe?cient of determination r2 associated with using the values of y_predicted in lieu of the values of y_data.
    [m,~] = size(y_data);
    y_bar=0;
    r2_den=0;
    r2_num=0;
    e2=0;
    for i=1:m
        r2_num = r2_num +(y_data(i) - y_predicted(i))^2;
        e2 = e2 + (y_predicted(i)-y_data(i))^2;
        y_bar = y_bar + y_data(i);
    end
    y_bar = y_bar/m;
    
    for i=1:m
        r2_den = r2_den + (y_data(i) - y_bar)^2;
    end
    
    r2 = (1 - (r2_num / r2_den));
end
    