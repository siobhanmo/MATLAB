function [coefficients] = my_splines_coefficients(x_data, y_data, condition)
% x_data and y_data are two m × 1 arrays of class double that represent two-dimensional data. In other words, these column vectors represent a set of points of coordinates (x_data(i), y_data(i)), i = {1, 2, . . . , m}. You can assume that m > 3, that all the elements of x_data and y_data are di?erent from NaN, Inf, and -Inf, and that the ele-ments of x_data are di?erent from each other and sorted in increasing order..
% condition is a 1 × 1 struct array (see below for details).
% coefficients is a (m ? 1) × 4 array of class double that represents the coe?cients of the cubic splines corresponding to the x- and y-data represented by x_data and y_data, re-spectively. In coefficients, each row represents one spline: row number i represents the spline between the points of coordinates (x_data(i),y_data(i)) and (x_data(i+1),y_data(i+1)). The four values in the row represent the coe?cients a, b, c, and d of the corresponding spline, where the equation of the spline is y = ax3 + bx2 + cx + d.
    matrix = [];
    x = {};
    dx = {};
    ddx = {};
    [m,~] = size(x_data);
    %putting x_data into cubic form
    for i=1:m
        x{i} = [x_data(i)^3, x_data(i)^2,x_data(i),1];                                                                                                                                                                                                          
    end
    %making dx and ddx
    for i=2:m-1
        dx{i} = [3*x_data(i)^2, 2*x_data(i),1,0,-3*x_data(i)^2, -2*x_data(i),-1,0,];
        ddx{i} = [6*x_data(i), 2,0,0,-6*x_data(i), -2,0,0,];
    end    
    %putting x into eye form
    for i=1:m-1
        if i==1
            matrix = [x{i}, zeros(1,4*(m-i))];
            matrix = [matrix; x{i+1}, zeros(1,4*(m-i))];
        else
            matrix = [matrix; zeros(1,4*(i-1)),x{i}, zeros(1,4*(m-i))];
            matrix = [matrix; zeros(1,4*(i-1)),x{i+1}, zeros(1,4*(m-i))];
        end
    end
    %putting dx and ddx into eye form
    for i=2:m-1
        if i==1
            matrix = [matrix; dx{i}, zeros(1,4*(m-i-1))];
        else
            matrix = [matrix; zeros(1,4*(i-1)),dx{i}, zeros(1,4*(m-i-1))];
        end
    end
    for i=2:m-1
        if i==1
            matrix = [matrix; ddx{i}, zeros(1,4*(m-i-1))];
        else
            matrix = [matrix; zeros(1,4*(i-1)),ddx{i}, zeros(1,4*(m-i-1))];
        end
    end
    
    % conditions
    if isequal(condition.type,'natural')
        matrix = [matrix;6*x_data(1), 2,0,0, zeros(1,4*(m-1)-1),6*x_data(m),2,0,0];
    elseif strcmp(condition.type,'clamped')
        matrix = [matrix;3*x_data(1)^2, 2*x_data(1),1,0, zeros(1,4*(m-1)-1),3*x_data(m)^2, 2*x_data(1),1,0];
    elseif strcmp(condition.type(1),'not-a-knot')
        matrix = [matrix;6,0,0,0, zeros(1,4*(m-1)-1),6,0,0,0];
    end
    %making y
    [r,c] = size(matrix)
    for i=1:m
        if i==1
            y(i) = [y_data(i)];   
        elseif i==m
            y(i) = [y_data(i)];
        else            
            y = [y;y_data(i);y_data(i)];
        end
    end    
    y = [y; zeros(r-(2*(m-1))+1,1)];
    [r1,c1] = size(y)
    coefficients = pinv(matrix)*y; 
end