function [t, response] = my_water_tank(m, c, k, p, dt, initial_state)
%m, c, and k are scalars of class double that represent m, c, and k in Equation 14, respec-tively.
% p is a 1 × n array of class double that represents the horizontal force applied to the water tank at each time at which your function will calculate a numerical approximate solution to Equation 14. p(i) represents p((i ? 1)?t).
% dt is a scalar of class double that represents the time step ?t that your numerical solver will use.
% initial_state is a 2 × 1 array of class double where the ?rst element represents the initial horizontal displacement u0 of the tank, and where the second element represents the initial horizontal velocity u(t = 0) of the tank.
% t is a 1 × n array of class double that represents, in increasing order, the equally-spaced points at which your function will calculate an approximate solution to Equation 14.
% response is a 2 × n array of class double where the ?rst row represents the values of the horizontal displacement u of the tank at each time step, and where the second row represents the values of the horizontal velocity u of the tank at each time step. These values should be calculated by applying Heun’s method to Equation 14 with time step ?t.
    
    z1 = initial_state(1);
    z2 = initial_state(2);
    
    [~,t_temp] = size(p);
    tf = dt*(t_temp-1);
    t = (0:dt:tf);
    
    vel = zeros(1,t_temp);
    vel(1) = z2;
    dis = zeros(1,t_temp);
    dis(1) = z1;
    
    temp = [dis;vel];
    temp_star = zeros(size(temp));
    
    for i=1:t_temp-1       
        % -(c/m)*z(2) - (k/m)*z(1) + (1/m)*p(i);
        g_i = @(z) [z(2); - (c/m)*z(2) - (k/m)*z(1) + (1/m)*p(i)];        
        temp_star(:,i+1) = temp(:,i) + g_i(temp(:,i))*dt;
        
        
        g_j = @(z) [z(2); - (c/m)*z(2) - (k/m)*z(1) + (1/m)*p(i+1)];
        temp(:,i+1) = temp(:,i) + (g_i(temp(:,i)) + g_j(temp_star(:,i+1)))*(dt/2);
    end
    
    response = temp;
end