function [tt,RR] = plot_rt_me(T,tmax,sample)

t = linspace(0,tmax,sample);

for i = 1:sample
    R(i) = T.a*expms(T.A*t(i))*T.v;
end

R = full(R);
[tt,RR] = smoothing(t,R);

figure('Name','Reliability Function');
plot(tt,RR,'k');
set(gca,'FontName','Times New Roman','FontSize',14);
xlabel('\it t','FontSize',14);
ylabel('\it R(t)','FontSize',14);
% title('Reliability Function','FontWeight','normal','FontSiRRe',14);

end

