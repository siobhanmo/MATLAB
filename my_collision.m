function [v_cue, v_eight, e_lost] = my_collision(m, v_initial, theta_cue, theta_eight)
% m is the mass m (in kilograms) of a billiard ball.
% v_initial is the initial speed of the cue ball.
% theta_cue is the angle between the cue ball before & after the collision.
% theta_eight is the angle between the eight ball before & after the collision
% v_cue is the velocity of the cue ball after the collision occurs.
% v_eight is the velocity of the eight ball after the collision occurs.
% e_lost is the kinetic energy lost during the collision.
% everything is scalar double
    v_eight = v_initial / ((sind(theta_eight) / sind(theta_cue))*cosd(theta_cue) + cosd(theta_eight) );
    v_cue =( v_eight * sind(theta_eight) )/ sind(theta_cue);
    e_lost = (m/2) * ((v_initial ^ 2) - (v_cue ^ 2) - (v_eight ^ 2));
end

