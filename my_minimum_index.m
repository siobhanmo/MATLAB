function [minimum, index] = my_minimum_index(vector)
% vector is a row vector of class double that contains at least one value. 
% minimum (scalar, double) represents the minimum value of vector.
% index (scalar, double) represents the index of the ?rst occurrence in vector of the minimum value of vector.
    min = vector(1);
    ind = 1;
    nan = 0;
        for i=2: length(vector)
            new = vector(i);
            if new < min && ~isnan(new)
                min = new;
                ind = i;
            elseif isnan(vector(i))
                nan = nan +1;    
            end
            
        end
    minimum = min;
    index = ind;
        if nan == length(vector)
            minimum = NaN;
            index = 1;
        end
end