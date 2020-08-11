function [n_solutions, x, square_error] = my_solve_system(a, b)
    
    lastwarn(' ');
    square_error = 0;
    [m,n] = size(a);
    [sol] = linsolve(a,b);
    
    if ~(length(sol)== m)
        n_solutions = 0;
         x = pinv(a)*b;
        
    elseif strcmp(lastwarn, 'Matrix is singular to working precision.')
        n_solutions = Inf;
        x = pinv(a)*b;
    else
        n_solutions = 1;
        x = pinv(a)*b;
    end
    
    for i=1: numel(b)
            s=0;
            for j=1:n
                s = s + a(i,j)* x(j);
            end
            square_error =square_error+ (s - b(i))^2;
    end
        
end