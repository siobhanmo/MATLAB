function [forward, backward, central] = my_generic_derivative(x_data, y_data)
%x_data and y_data are two 1 × m arrays of class double that represent two-dimensional data. In other words, these row vectors represent a set of points of coordinates (x_data(i),
    %y_data(i)), i = {1, 2, . . . , m}. You can assume that m > 3, that all the elements of x_data
    %and y_data are di?erent from NaN, Inf, and -Inf, and that the elements of x_data are di?erent from each other and sorted in increasing order.
% forward is a 1 × m array of class double whose elements are the values of the deriva-tive of the function associated with the x- and y-data mentioned above, estimated at points x_data(i) with i ? {1, 2, . . . , m}, in this order, using the ?rst-order forward ?nite-di?erence formula.
% backward is a 1 × m array of class double whose elements are the values of the derivative of the function associated with the x- and y-data mentioned above, estimated at points
    % x_data(i) with i ? {1, 2, . . . , m}, in this order, using the ?rst-order backward ?nite-
    % di?erence formula.
% central is a 1 × m array of class double whose elements are the values of the derivative of the function associated with the x- and y-data mentioned above, estimated at points
% x_data(i) with i ? {1, 2, . . . , m}, in this order, using the second-order central ?nite-
% di?erence formula.
x = length(x_data);

central = ones(1,x);
forward = ones(1,x);
backward = ones(1,x);

for i =2:x-1
   central(i) = (y_data(i+1) - y_data(i-1)) / (x_data(i+1) - x_data(i-1)); 
end
for i =2:x-1
   backward(i) = (y_data(i) - y_data(i-1)) / (x_data(i) - x_data(i-1)); 
end
for i =1:x-1
   forward(i) = (y_data(i+1) - y_data(i)) / (x_data(i+1) - x_data(i)); 
end

forward(x)=NaN;
backward(1) = NaN;
central(1) = NaN;
central(x) = NaN;
end