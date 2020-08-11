function [score, warning] = my_water_quality(ph, do)
% ph (scalar, double) that represents the pH of the water.
% do (scalar, double) is concentration of dissolved oxygen (in mg L? 1) in the water.
% score (scalar, double) is water quality score, should be the average of the pH score and the DO score 
% **if either ph or do is outside of the range of values then score should have the value NaN*
% warning (scalar, log) is true if score is NaN, or iff water is unsafe:
% -the pH outside of the interval [6.5, 8.5]
% -the DO concentration in the water source is less than 4 mg L? 1
w = 0;
g = 0;
warning = true;
    if ph >= 6.5 && ph <= 7.5
        ph_score = 5;
        g= g+1;
        w = w+ 1;
    elseif ph > 7.5 && ph <= 8
        ph_score = 4;
        g= g+1;
        w = w+ 1;
    elseif ph > 8 && ph <= 8.5
        ph_score = 3;
        g= g+1;
        w = w+ 1;
    elseif (ph >= 6 && ph < 6.5) || (ph > 8.5 && ph <= 9)
        ph_score = 2;
        g= g+1;
    elseif (ph >= 5.5 && ph < 6) || (ph > 9 && ph <= 9.5)
        ph_score =1;
        g= g+1;
    elseif (ph >= 0 && ph < 5.5) || (ph > 9.5 && ph <= 14)
        ph_score = 0;
        g= g+1;
    elseif ph > 14 || ph < 0
        score = NaN;
    end
    
    if do >= 7 && do <= 11
        do_score = 5;
        g= g+1;
        w = w+ 1;
    elseif do >= 4 && do < 7
        do_score = 3;
        g= g+1;
        w = w+ 1;
    elseif do >=2 && do <4
        do_score = 1;
        g= g+1;
    elseif do>=0 && do <2
        do_score = 0;
        g= g+1;
    else
        score = NaN;
    end
    
    if g == 2
    score = (ph_score + do_score)/2;
    else
        score = NaN;
    end
    
    if w == 2
        warning = false;
    end
    
end
        