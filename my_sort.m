function [sorted] = my_sort(vector)
% vector is a (possibly empty) row vector of class double.
% sorted is a row vector of class double that has the same size as vector and that contains the same values as vector, but ordered in increasing order.
    sorted = vector;
    for i=1: length(sorted)
        [minimum, index] = my_minimum_index(vector);
        vector(index) = [];
        sorted(i) = minimum;
    end
end