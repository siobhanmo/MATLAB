function [reversed] = my_reverse_with_recursion(vector)
% vector is a (possibly empty) row or column vector of class char, double, or logical.
% reversed is a vector that has the same size and class as vector, and is reverse vector.
l=length(vector);
a = size(vector);
if a(1) == 1 && a(2) == 1
    reversed = vector(l);
elseif a(1) > 1
    reversed = [vector(l); my_reverse_with_recursion(vector(1:(l-1)))];
elseif a(2) > 1
    reversed = [vector(l), my_reverse_with_recursion(vector(1:(l-1)))];
end
end