function [reversed] = my_reverse_without_recursion(vector)
% vector is a (possibly empty) row or column vector of class char, double, or logical.
% reversed is a vector that has the same size and class as vector, and is reverse vector.
reversed = vector;
for i=1:length(vector)
    reversed(i) = vector((length(vector)+1-i));
end

end