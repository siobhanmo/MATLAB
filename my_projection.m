function [p] = my_projection(x, y)
% x and y are vectors and p is the projection of y onto x
p = (sum(x .* y) / sum(x .* x)) .* x; 
end