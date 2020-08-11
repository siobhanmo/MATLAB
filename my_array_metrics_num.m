function [n_positive, n_negative, n_zero, n_special] = my_array_metrics_num(array)
% array is an arbitrary n × m array of class double.
% all outputs (scalar, double) repre-sent the # of positive, negative, zero, & “special” values (NaN/Inf) 
        np = array;
        np(array > 0) = 1;
        np(array < 0) = 0;
        np(isnan(array)) = 0;
    n_positive = sum(sum(np));
    if max(max(np)) == Inf
        n_positive = n_positive + 1;
    end
        nn = array;
        nn(array < 0) = 1;
        nn(array > 0) = 0;
        nn(isnan(array)) = 0;
    n_negative = sum(sum(nn));
    if min(min(nn)) == -Inf
        n_negative = n_negative + 1;
    end
        nz = array;
        nz(~(array == 0)) = 0;
        nz((array == 0)) = 1;
    n_zero = sum(sum(nz));
        ns = sum(sum(isnan(array)));
        nss = sum(sum(isinf(array)));
    n_special = ns+ nss;
end