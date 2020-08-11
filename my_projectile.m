function [solution] = my_projectile(v0, theta, t)
% v0 (scalar, double) is vel of the projectile at time t = 0.
% theta (scalar, double) is angle btwn v0 & the ground.
% t (scalar, double) is time.
% solution is an 1×13 row vector (double). The array is in this order:
% [v0x, v0y, ax, ay, a, vx_t, vy_t, v_t, x_t, y_t, d_t, tf, h]
    v0x = v0 * cosd(theta);
    v0y = v0 * sind(theta);
    ax = 0;
    ay = -9.81;
    a = 9.81;
    vx_t = v0x;
    vy_t = v0y + ay * t;
    v_t = sqrt(vx_t^2 + vy_t^2);
    x_t = v0x * t;
    y_t = v0y*t + .5 * ay * t^2;
    d_t = sqrt(x_t^2 + y_t^2);
    tf = 2 * v0y / a;
    h = v0y^2 / (2 * a); 
    solution = [v0x, v0y, ax, ay, a, vx_t, vy_t, v_t, x_t, y_t, d_t, tf, h];
   
end