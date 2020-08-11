function [positive, negative, zero, special] = my_array_metrics_lgcl(array)
% array is an arbitrary n × m array of class double.
% positive (scalar logical) that is true iff contains at least one positive value.
% negative (scalar logical) that is true iff contains at least one negative value.
% zero (scalar logical) that is true iff contains at least one zero value.
% special (scalar logical) that is true iff contains at least one “special” value (NaN, Inf)
    % work for positive
    p = array;
    p(array > 0) = 1;
    p(array < 0) = 0;
    p(isnan(array)) = 0;
    p_sum = sum(sum(p));
    if p_sum > 0
        positive = true;
    else
        positive = false;    
    end
    % work for negative
    n = array;
    n(array > 0) = 0;
    n(array < 0) = 1;
    n(isnan(array)) = 0;
    if sum(sum(n)) > 0
        negative = true;
    else
        negative = false;    
    end
    % work for zero
    z = array;
    z(array == 0) = 1;
    z(~(array == 0)) = 0;
    if sum(sum(z)) > 0
        zero = true;
    else
        zero = false;
    end
    % work for special
    s = array;
    s0 = zeros(size(array));
    if isequal(isnan(s), s0) && isequal(isinf(s), s0)
        special = false;
    elseif isequal(isinf(s), s0) || isequal(isinf(s), s0) == false
        special = true;
    end
        
    end
    