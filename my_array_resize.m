function array_out = my_array_resize(array_in, dimension)
% array_in is an m by n array of class double to be resized.
% dimension (string) should take one following values (case-insensitive):
% ’row’. the array array_in should be resized by appending m rows of zeros to the bottom of the array.
% ’col’. the array array_in should be resized by appending n columns of zeros to the right of the array.
% ’both’. resizes by both 
% array_out is the resized array. Its class should be double.
    a = size(array_in);
    m = a(1,1);
    n = a(1,2);
    if strcmpi(dimension, 'row')
        array_out = [array_in; zeros(m,n)];
    elseif strcmpi(dimension,'col')
        array_out = [array_in, zeros(m,n)];
    elseif strcmpi(dimension,'both')
        array_out = [array_in, zeros(m,n); zeros(m,n+n)];
    else
        array_out = array_in;
    end
end
        