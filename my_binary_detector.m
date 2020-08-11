function [representations] = my_binary_detector(binary, integer)
% *binary* (1 × n row vector, char) contains zeros (’0’) &/or ones (character ’1’) 
% you can assume that n > 1 
% *integer* (scalar, double) represents an integer (positive, negative, or zero)
% *representations* (1 × m cell array) (with m <= 3) that contains 0, 1, 2, or all 3 of the strings:
% ’unsigned’ iff the binary is the un-signed n-bit binary representation of the integer
% ’signmagnitude’ iff the binary is the sign-magnitude n-bit binary representation of integer.
% ’twoscomplement’ iff the binary is the two’s complement n-bit binary representation of integer.
representations = {};

u_sum = 0;
for i=1 : length(binary)
    u_sum = u_sum + str2double(binary(i)) * 2^(length(binary)-i);
end

s_sum = 0;
for i=1 : length(binary)-1
    s_sum = s_sum + str2double(binary(i+1)) * 2^(length(binary)-i-1);
end
if str2double(binary(1)) == 1
    s_sum = (-1) * s_sum;
end

c_sum = 0;

for i=1 : length(binary)
    c_sum = c_sum + str2double(binary(i)) * 2^(length(binary)-i);
end
if str2double(binary(1)) == 1
    c_sum = (-1) * c_sum;
end

if integer == s_sum
    representations = [representations,'signmagnitude'];
end
if integer == c_sum
    representations = [representations, 'twoscomplement'];
end
if integer == u_sum
    representations = [representations, 'unsigned'];
end

end