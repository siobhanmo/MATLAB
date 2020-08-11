function [rmse] = my_taylor_approx(p, a, n)
    z = linspace(0,1);
    V = [1:1:100];
    V_1 = [zeros(1,100)];
    v_t =0;
    v=0;
    f0 = @(x) p(1)*x^3+p(2)*x^2+p(3)*x+p(4);
    f1 = @(x) 3*p(1)*x^2+p(2)*2*x+p(3);
    f2 = @(x) 6*p(1)*x + 2*p(2);
    
    V = arrayfun(f0, V);
    for i=1:100        
            if n == 0
                V_1(i) = f0(a) + ((f0(z(i))*a)/ factorial(0)) * (z(i)-a)^0;
            elseif n ==1
                V_1(i) = f0(a) + ((f0(z(i))*a)/ factorial(0)) * (z(i)-a)^0 + ((f1(z(i))*a)/ factorial(1)) * (z(i)-a)^1;
            elseif n ==2
                V_1(i) = f0(a) + ((f0(z(i))*a)/ factorial(0)) * (z(i)-a)^0 + ((f1(z(i))*a)/ factorial(1)) * (z(i)-a)^1 + ((f2(z(i))*a)/ factorial(2)) * (z(i)-a)^2;
            end  
    end
    v_t = sum((V - V_1));
    rmse = sqrt((1/100)*v_t^2);
end