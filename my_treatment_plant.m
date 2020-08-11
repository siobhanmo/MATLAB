function [concentrations] = my_treatment_plant(q, c_1, x, y, removals)

rate_eq = [((-x)*q -(1-x)*q),0,0,0;(x*q),((-x)*y*q-x*(1-y)*q),0,0;((1-x)*q),(x*(1-y)*q),0,(-(1-x*y)*q);0,(x*y*q),(-q),((1-x*y)*q)];
removals(1) = (removals(1) - c_1*q);
[~, c, ~] = my_solve_system(rate_eq,removals);
concentrations = [c_1;c];

end