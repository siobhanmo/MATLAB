function [delimiter, left, right] = my_parser(string, delimiters)
% string is a (possibly empty) row vector of class char.
% delimiters is a row vector of class char, has at least one value, and each char is a distinct delimiter.
% delimiter is a 1 by 1 array of class char whose value should be the ?rst delimiter (among the delimiters speci?ed by delimiters) that appears in string.
% left is a row vector of class char whose value is the part of string located to the left of the ?rst delimiter that appears in string (excluding the delimiter itself).
% right is a row vector of class char whose value is the part of string located to the right of the ?rst delimiter that appears in string (excluding the delimiter itself).

%checking if delimiters exist in string, documenting index
index = 0;
index2 = 0;
for j=1:length(string)
    for k=1: length(delimiters)
        if isequal(string(j), delimiters(k))
            index = k;
            index2 = j;
            break;
        end
    end
end

%condition if no delimiters exist -> when they do
if index == 0
    left = string;
    delimiter = ' ';
    right = ' ';
else
    left = string(1:index2-1);
    delimiter = string(index2);
    right = string(1, index2+1:end);
end
end