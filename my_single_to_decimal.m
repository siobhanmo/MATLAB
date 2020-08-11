function [result] = my_single_to_decimal(binary)
% binary is 1 × 32 row vector of class char that can only contain zeros (’0’) and/or ones (’1’)
% result (scalar, double) represents the ?oating point number (in base 10) that is represented by binary 

s = str2double(binary(1));
d=127;

e = 0;
bin_e = binary(2:9);
for i=1 : length(bin_e)
    e = e + str2double(bin_e(i)) * 2^(length(bin_e)-i);
end

f=0;
bin_f = binary(10:32);
for i=1 : length(bin_f)
    f = f + str2double(bin_f(i)) * 2^( (-1) * (i));
end

if ~(e==0) && ~(e==(2*d + 1))
    result = (-1)^s * 2^(e-d) * (1+f); 
elseif e==0 && ~(f==0)
    result = (-1)^s * 2^(1-d) * f;
elseif e==0 && f==0
    result = 0;
elseif (e == (2*d+1)) && (f==0)
    result = (-1)^s * Inf;
elseif (e == (2*d+1)) && ~(f==0)
    result = NaN;
end
end
    
    
