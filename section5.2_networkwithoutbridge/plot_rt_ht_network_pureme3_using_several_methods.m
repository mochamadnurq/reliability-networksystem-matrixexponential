% Plot Reliability and Hazard function of network

clc
clear
addpath('data')

%% Plot Reliability Function

load mesdp_pureme3.mat
figure('Name','Reliability Function');
plot(tt,RRs,'k','LineWidth',1);
set(gca,'FontName','Times New Roman','FontSize',14);
xlabel('\it t','FontSize',14);
ylabel('\it R(t)','FontSize',14);
hold on

load mesdpjordan_pureme3.mat
plot(t,Rs,'ko','MarkerSize',10);

load phcp_pureme3_5points.mat
plot(t,Rs_ph,'kx','MarkerSize',10);

legend({'SDP','SDP-Jordan','CP'},'FontSize',14)
axis([0 4 0 1])
hold off

%% Plot Hazard Function

load mesdp_pureme3.mat
figure('Name','Hazard Function');
plot(tt,hhs,'k','LineWidth',1);
set(gca,'FontName','Times New Roman','FontSize',14);
xlabel('\it t','FontSize',14);
ylabel('\it h(t)','FontSize',14);
hold on

load mesdpjordan_pureme3.mat
plot(t,hs,'ko','MarkerSize',10);

load phcp_pureme3_5points.mat
plot(t,hs_ph,'kx','MarkerSize',10);

legend({'SDP','SDP-Jordan','CP'},'FontSize',14,'location','northwest')
axis([0 4 0 4])
hold off
