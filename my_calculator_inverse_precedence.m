function [result] = my_calculator_inverse_precedence(expression)
% expression is a row vector of class char that represents an arithmetic expression 
% result is a scalar of class double that represents the value of the arithmetic expression described by expression.
% expression is not empty
% expression is a valid arithmetic expression.
% expression contains only characters among: 0123456789.+-*/ˆ
% ?rst character in expression is one of the 10 digits
% There are no two operators in a row (e.g., +-) in expression.
index = [];
del = [];
for i=1: length(expression)
    if strcmp(expression(i), '+')
        index = [index, i];
        del = [del, '+'];
    end
end

for i=1: length(expression)
    if strcmp(expression(i), '-')
        index = [index, i];
        del = [del, '-'];
    end
end

for i=1: length(expression)
    if strcmp(expression(i), '*')
        index = [index, i];
        del = [del, '*'];
    end
end

for i=1: length(expression)
    if strcmp(expression(i), '/') 
        index = [index, i];
        del = [del, '/'];
    end
end

for i=1: length(expression)
    if strcmp(expression(i), '^')
        index = [index, i];
        del = [del, '^'];
    end
end

for i=1:length(index)
    if strcmp(index(i), '+')
        str2double(expression(
end
