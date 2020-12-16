function [tt,FF] = plot_cdf_me(T,tmax,sample)
% [xx,yy] = plot_cdf_matrix(T,tmax,sample)
%
% Plot cumulative distribution function of ME variable T.
% T      : PH variable in struct (T.a, T.A, T.v, T.n)
% tmax   : maximum time
% sample : number of points
% tt     : time vector after smoothing
% FF     : vector of CDF values after smoothing

t = linspace(0,tmax,sample);

for i=1:sample
    e    = expms(T.A*t(i));    
    F(i) = 1-T.a*e*T.v;
end

F = full(F);
tt = linspace(0,tmax,5*sample);
FF = interp1(t',F,tt,'pchip');

figure('Name','CDF');
plot(tt,FF,'k','LineWidth',2);
set(gca,'FontName','Times New Roman','FontSize',14);
xlabel('\it t','FontSize',14);
ylabel('\it F(t)','FontSize',14);
title('Cumulative Distribution Function','FontWeight','normal','FontSize',14);

end

