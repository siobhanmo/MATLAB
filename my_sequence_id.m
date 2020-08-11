function [next_term] = my_sequence_id(a, b, c)
% a, b, and c are scalars of class double that represent integers.
% next_term is a scalar of class double (see below for description).
v = false;
u = false;
w = false;

    if isequal(a+b, c)
        next_term = b+c;
        u = true;
    end
    if isequal(b-a, c)
        next_term = c-b;        
        v = true;
    end
    if isequal(a*b, c)
        next_term = b*c;
        w = true;
    end
    
    if w && v && u
        next_term = b+c;
    elseif (u && v) || (u && w) || (v && w) 
        next_term= NaN;
    end
    
    if ~(u || v || w)
        next_term = NaN;
    end
end
        