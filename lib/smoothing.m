function [tt,yy] = smoothing(t,y)

tmax             = t(end);
number_of_points = length(t);
y  = full(y);
tt = linspace(0,tmax,5*number_of_points);
yy = interp1(t',y,tt,'pchip');

end