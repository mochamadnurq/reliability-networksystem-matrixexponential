% Plot Reliability Function

clc
clear
addpath('data')

load arpanet_Weibull_APH3.mat

figure('Name','Reliability Function');
plot(tt,RRsme,'k',t,Rs,'k--','LineWidth',1);
set(gca,'FontName','Times New Roman','FontSize',14);
legend({'SDP for reliability function using PH (n = 3)','SDP for reliability values using Weibull distribution'},'FontSize',13);
xlabel('\it t','FontSize',14);
ylabel('\it R(t)','FontSize',14);
axis([0 tmax 0 1.2]);

figure('Name','Hazard Function');
plot(tt,hhsme,'k','LineWidth',1);
set(gca,'FontName','Times New Roman','FontSize',14);
xlabel('\it t','FontSize',14);
ylabel('\it h(t)','FontSize',14);
axis([0 tmax 0 0.7]);