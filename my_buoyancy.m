function [depth] = my_buoyancy(radius, rho_solid, rho_liquid, tolerance)
% radius is a scalar of class double that represents the radius rs (in m) of the spherical solid.
% rho_solid is a scalar of class double that represents the density ?s (in kg m?3) of the solid.
% rho_liquid is a scalar of class double that represents the density ?l (in kg m?3) of the liquid in which the solid is at rest.
% tolerance is a scalar of class double that is positive and that is neither NaN nor Inf.
% depth is a scalar of class double that represents the depth h (in m) of the submerged part of the solid. 
% Your function should estimate this quantity by applying the Newton-Raphson, rs as an initial guess, and |f(depth)| <= tolerance
    depth = radius;
    f = @(depth) (4*(radius^3)*rho_solid) - ((depth)^2 * (3*radius - depth)*rho_liquid);
    df = @(depth) (-(depth^2)*(-rho_liquid) + ((-1)*2*depth)*(3*radius*rho_liquid - depth*rho_liquid));
    while abs(f(depth)) > tolerance 
        depth = depth - f(depth)/df(depth); 
    end
end