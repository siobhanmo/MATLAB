function [word] = my_morse_to_word(morse)
% morse is a n × 3 array of class double that is the Morse Code representation of a word as described above. 
% you can assume that n > 0.
% word is a 1 × n row vector of class char  
% the letters in word should all be in upper case.

D = [1,0,0];
G = [1,1,0];
K = [1,0,1];
O = [1,1,1];
R = [0,1,0];
S = [0,0,0];
U = [0,0,1];
W = [0,1,1];

a = size(morse);
word = ' ';

for i=1 : a(1)
        if isequal(morse(i,1:3),D)
            word = strcat(word,'D');
        elseif isequal(morse(i,1:3),G)
            word = strcat(word,'G');
        elseif isequal(morse(i,1:3),K)
            word = strcat(word,'K');
        elseif isequal(morse(i,1:3),O)
            word = strcat(word,+'O');
        elseif isequal(morse(i,1:3),R)
            word = strcat(word,'R');
        elseif isequal(morse(i,1:3),S)
            word = strcat(word,'S');
        elseif isequal(morse(i,1:3),U)
            word = strcat(word,'U');
        elseif isequal(morse(i,1:3),W)
            word = strcat(word,'W');
        end
end
end
