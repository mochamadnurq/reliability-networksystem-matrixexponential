% Plot Reliability Function

clc
clear
addpath('data')

load component_Weibull_APH3.mat

figure('Name','Reliability Function');
plot(tt,RRme,'k',t,R,'k--','LineWidth',1);
set(gca,'FontName','Times New Roman','FontSize',14);
legend({'Reliability function using PH (n = 3)','Reliability values using Weibull distribution'},'FontSize',13);
xlabel('\it t','FontSize',14);
ylabel('\it R(t)','FontSize',14);
axis([0 tmax 0 1.2])