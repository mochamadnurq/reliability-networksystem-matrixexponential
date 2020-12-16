function [tt,ff] = plot_pdf_me(T,tmax,sample)
% [tt,ff] = plot_pdf_me(T,tmax,sample)
%
% Plot probability density function (PDF) of ME variable T.
% T      : PH variable in struct (T.a, T.A, T.v, T.n)
% tmax   : maximum time
% sample : number of points
% tt     : time vector after smoothing
% ff     : vector of PDF values after smoothing

t = linspace(0,tmax,sample);

for i = 1:sample
    e    =  expms(T.A*t(i));    
    f(i) = -T.a*e*T.A*T.v;
end

f  = full(f);
tt = linspace(0,tmax,5*sample);
ff = interp1(t',f,tt,'pchip');

figure('Name','PDF');
plot(tt,ff,'k');
set(gca,'FontName','Times New Roman','FontSize',14);
xlabel('\it t','FontSize',14);
ylabel('\it f(t)','FontSize',14);
title('PDF','FontWeight','normal','FontSize',14);

end

