function [bookshelf] = my_ddc(books)
% books is a n×4 cell array where each row represents a book. 
% A book is represented by the 4 following quantities:
     % 1. A row vector of class char that represents the ?rst summary of the book, among the values:
          % ’Language’ (4)  ’Literature’ (8) 
     % 2. A row vector of class char that represents the second summary of the book,among the values: 
          %’English’ (2)  ’French’ (4)  ’Italian’ (5) 
     % 3. A row vector of class char that represents the third summary of the book
          % ’Language’:  ’Phonology’ (1)  ’Etymology’ (2)  ’Grammar’ (5) 
          % ’Literature’: ’Poetry’ (1)  ’Drama’ (2)  ’Speeches’ (5)
     % 4. A row vector of class char that represents the title of the book. 
% bookshelf is a 2 × n cell array where each column represents a book [DDC number ; title of the book] 
% if a book cannot be classi?ed its DDC number = NaN and its title = ’Discard’.
a = size(books);
r = a(1);
ddc = ' ';
temp = {};
title ={};
n=0;

for i=1 : r
    for j=1:3
        if strcmp(books{i, j}, 'Language')
            ddc = strcat(ddc, '4');
        elseif strcmp(books{i, j}, 'Literature')
            ddc = strcat(ddc, '8');
        elseif strcmp(books{i, j}, 'English')
            ddc = strcat(ddc, '2');
        elseif strcmp(books{i, j}, 'French')
            ddc = strcat(ddc, '4');
        elseif strcmp(books{i, j}, 'Italian')
            ddc = strcat(ddc, '5');
        elseif strcmp(books{i, j}, 'Phonology')
            ddc = strcat(ddc, '1');
        elseif strcmp(books{i, j}, 'Etymology')
            ddc = strcat(ddc, '2');
        elseif strcmp(books{i, j}, 'Grammar')
            ddc = strcat(ddc, '5');
        elseif strcmp(books{i, j}, 'Poetry')
            ddc = strcat(ddc, '1'); 
        elseif strcmp(books{i, j}, 'Drama')
            ddc = strcat(ddc, '2');
        elseif strcmp(books{i, j}, 'Speeches')
            ddc = strcat(ddc, '5');
        else 
            ddc = strcat(ddc, 'NaN');
            n=1;
        end
    end
    temp{i} = [str2double(ddc)];
    ddc = ' ';
    if n==1
        title{i} = 'Discard';
        n=0;
    else
    title{i} = books{i,4};
    end
end
bookshelf = [temp ; title];
end