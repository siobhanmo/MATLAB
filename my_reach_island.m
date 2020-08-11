function [theta] = my_reach_island(d_beach, d_water, b, v_beach, v_water)
% d_beach is a scalar of class double that represents the distance dB (in m) between your initial position and the shoreline.
% d_water is a scalar of class double that represents the distance dW (in m) between the shoreline and the island.
% b is a scalar of class double that represents the distance (in m) along the x-axis between your initial location and the island.
% v_beach is a scalar of class double that represents the speed (in m s?1) at which you run on the beach.
% v_water is a scalar of class double that represents the speed (in m s?1) at which you swim in the water.
% theta is a scalar of class double that represents the angle (in degrees) formed between your running trajectory and the shoreline, and such that you reach the island in as little time as possible.
    t = @(a) (sqrt(a^2 + d_beach^2)/v_beach) + (sqrt((b-a)^2 + d_water^2)/v_water);
    dt = @(a) (a./(  sqrt(  (a).^2 + d_beach.^2  ).*v_beach  ) - ((b-a)./(  sqrt(  (b-a).^2 +d_water.^2  ).*v_water  )));

    [n_iterations, am] = my_root_bisection(dt, 0, b, .000001);
        
    theta = atand(d_beach/am);
    
end
    

