% Plot Reliability and Hazard function of network

clc
clear
addpath('data')

%% Plot Reliability Function

load phcp_ph4.mat
figure('Name','Reliability Function');
plot(tt,RRs_ph,'k','LineWidth',1);
set(gca,'FontName','Times New Roman','FontSize',14);
xlabel('\it t','FontSize',14);
ylabel('\it R(t)','FontSize',14);
hold on

load mesdp_ph4.mat
plot(t,Rs,'ko','MarkerSize',10);

load phcp_me3.mat
plot(t,Rs_ph,'kx','MarkerSize',10);

load mesdp_me3.mat
plot(t,Rs,'ks','MarkerSize',10);

legend({'PH-CP','PH-SDP','ME-CP','ME-SDP'},'FontSize',14)
axis([0 7 0 1])
hold off

%% Plot Hazard Function

load phcp_ph4.mat
figure('Name','Hazard Function');
plot(tt,hhs_ph,'k','LineWidth',1);
set(gca,'FontName','Times New Roman','FontSize',14);
xlabel('\it t','FontSize',14);
ylabel('\it h(t)','FontSize',14);
hold on

load mesdp_ph4.mat
plot(t,hs,'ko','MarkerSize',10);

load phcp_me3.mat
plot(t,hs_ph,'kx','MarkerSize',10);

load mesdp_me3.mat
plot(t,hs,'ks','MarkerSize',10);

legend({'PH-CP','PH-SDP','ME-CP','ME-SDP'},'FontSize',14,'location','northwest')
axis([0 7 0 1.6])
hold off
