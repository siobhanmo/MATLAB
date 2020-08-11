function [] = my_plot_3d_data(fh, xmin, xmax, ymin, ymax, n, xslice, yslice)
% fh is a function that takes 2 m×n arrays of class double as input arguments (x and y)
   % ^ returns a m × n array of class double (z) de?ned on R2 such that z(i,j) = f(x(i,j), y(i,j))
% n is a scalar of class double that represents a positive integer. See below for its description.
% xmin, xmax, ymin, ymax, xslice, and yslice are scalars of class double. See below for their descriptions.

    %for subplot 1
    figure
    [x,y] = meshgrid(xmin:(1/n):xmax,ymin:(1/n):ymax);
    subplot(2,2,1); 
    surf(x,y,fh(x,y));
    title('Surface plot');
    xlabel('x');
    ylabel('y');
    zlabel('z');
    
    %for subplot2
    subplot(2,2,2);
    contourf(x,y,fh(x,y));
    title('Filled contour plot');
    xlabel('x');
    ylabel('y');
    cb = colorbar('Location', 'EastOutside');
    ylabel(cb,'z');
    
    %for subplot3
    subplot(2,2,3);
    grid on    
    y = linspace(ymin,ymax,n);
    [x1,y1] = meshgrid(xslice,y);
    plot(fh(x1,y1));
    t1 = strcat('Slice at x = ', num2str(xslice));
    title(t1);
    xlabel('y');
    ylabel('z');
    
    %for subplot4
    subplot(2,2,4);
    grid on
    x = linspace(xmin,xmax,n);
    [x1,y1] = meshgrid(x,yslice);
    plot(fh(x1,y1));
    t2 = strcat('Slice at y = ', num2str(yslice));
    title(t2);
    xlabel('x');
    ylabel('z');
end
    