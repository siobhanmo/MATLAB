function [y_interp] = my_linear_interpolation(x_data, y_data, x_interp)
%x_data and y_data are two m × 1 arrays of class double that represent two-dimensional data. In other words, these column vectors represent a set of points of coordinates (x_data(i), y_data(i)), i = {1, 2, . . . , m}. You can assume that m > 1, that all the elements of x_data and y_data are di?erent from NaN, Inf, and -Inf, and that the ele-ments of x_data are di?erent from each other and sorted in increasing order.
% x_interp is a p × q array of class double that represents x-values at which to calculate interpolated values. You can assume that each element of this array is di?erent from NaN,
% Inf, and -Inf, and is within the range of values de?ned by x_data.
% y_interp is a p×q array of class double that represents the interpolated y-values calculated by linear interpolation (y_interp(i,j) is the interpolated value at x =x_interp(i,j)). For each element x_interp(i,j) of x_interp, the linear interpolation should be conducted between the two successive data points (in x_data and y_data) whose x-values bracket
%x_interp(i,j).
    y_interp=[];
    [n,m] = size(x_interp);
    for i=1:n
        for j=1:m            
            y_interp(i,j) = y_data(j) + ( (y_data(j+1)-y_data(j))/(x_data(j+1)-x_data(j)) * (x_interp(i,j)-x_data(j)));
        end
    end    
end
