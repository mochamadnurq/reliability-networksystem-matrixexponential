function [tt,hh] = plot_ht_me(T,tmax,sample)

t = linspace(0,tmax,sample);

for i = 1:sample
    ev = expms(T.A*t(i))*T.v;
    R(i) = T.a*ev;
    h(i) = -T.a*T.A*ev/R(i);
end

h = full(h);
[tt,hh] = smoothing(t,h);

figure('Name','hahhard Function');
plot(tt,hh,'k');
set(gca,'FontName','Times New Roman','FontSize',14);
xlabel('\it t','FontSize',14);
ylabel('\it h(t)','FontSize',14);
% title('hahhard Function','FontWeight','normal','FontSihhe',14);

end

