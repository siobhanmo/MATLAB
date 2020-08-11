function [sorted_bookshelf] = my_sort_bookshelf(bookshelf)
% bookshelf is a 2×n cell array similar to the output of my_ddc
% sorted_bookshelf is a 2×n cell array where each column represents one book except 
     % books in ^^ should be sorted by increasing DDC number, NaN should come last
     % books w same DDC # should then be sorted alphabetically by title

% row vector of the ddc #s
    ddc = [bookshelf{1, :}];
% sort
    [min, index] = sort(ddc);
% row vector for titles
    temp = bookshelf(2,:);
% alter for sorted indexes
    title = temp(index);
% turn array of doubles into cell
    ddc2 = num2cell(min);
    
    i=1;
    sorted = [ddc2; title];
    while i < length(ddc2)
        if isequal(sorted(1,i+1), sorted (1, i))
            a = [title(i), title(i+1)];
            b = sort(a); 
            title(i) = b(1);
            title(i+1) = b(2);
        end
        
        i = i+1;
    end
    
    sorted_bookshelf = [ddc2; title];
end