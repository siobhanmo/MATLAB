function [perimeter] = my_polygon_perimeter(x, y)
%x is a n×1 column vector of class double that represents the x-coordinates of the vertices of the polygon (i.e. x1, x2, . . . xn, in that order).
% y is a n×1 column vector of class double that represents the y-coordinates of the vertices of the polygon (i.e. y1, y2, . . . yn, in that order).
% perimeter is a scalar of class double that represents the perimeter of the polygon
ds = [((diff(x))),(diff(y))];
distance = sqrt(ds.^2);
last_x = x(end) - x(1);
last_y = y(end) - y(1);
delta = [last_x,last_y];
dist2 = sqrt(delta.^2);
perimeter = sum(sum(distance))+sum(sum(dist2));
end
