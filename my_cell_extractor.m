function [u, l, n, s] = my_cell_extractor(array)
% array is a 1 × n cell array. 
    % each element of array is either: row vector of class double, character string, cell array that follows the same format as array. 
% upper_case is a row vector of class char that contains all the upper case from the array
% lower_case is a row vector of class char that contains all the lower case from the array
% numbers is a row vector of class double that contains all the elements of class double from the array     
% special is a non-empty row vector of class double that contains all the elements of class double among NaN, -Inf, and Inf
i = 1;
u = [];
l = [];
n = [];
s = [];

while i <= numel(array)
    if iscell(array{i}) ||
        [u, l, n, s] = my_cell_extractor(array{i});
    elseif isa(array{i},'char') && strcmp(array{i}, upper(array{i}))
        u = [u, array{i}];
    elseif isa(array{i},'char') && strcmp(array{i}, lower(array{i}))
        l =[l, array{i}];
    elseif isa(array{i},'double') && ~isnan(array{i}) && ~isequal(abs(array{i}), Inf)
        n = [n, array{i}];
    elseif  isnan(array{i}) || isequal(abs(array{i}), Inf)
        s = [s, array{i}];
    end
    i=i+1;
end
end