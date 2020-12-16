% GENERAL SYSTEM
% Plot R(t), h(t) system for several components

clear 
addpath('data')

load rt_ht_ttf_pureme3.mat;
cv(1) = cvttfc_me;

load rt_ht_ttf_2Erlang.mat;
zz(:,2) = z1';
hh(:,2) = z3';
cv(2)  = cvttfc_me;

load rt_ht_ttf_exponential.mat;
zz(:,3) = z1';
hh(:,3) = z3';
cv(3)  = cvttfc_me;

load rt_ht_ttf_2Coxian_cv1.5.mat;
zz(:,4) = z1';
hh(:,4) = z3'; 
cv(4)  = cvttfc_me;

load rt_ht_ttf_fullme2_cv1.1391.mat;
zz(:,5) = z1';
hh(:,5) = z3'; 
cv(5)  = cvttfc_me;

%% Reliability Function
figure('Name','Reliability Function');
plot(tt,RRs,'k','LineWidth',1); hold on;
plot(xx,zz(:,2),'k','LineWidth',1);
plot(xx,zz(:,3),'k','LineWidth',1);
plot(xx,zz(:,4),'k','LineWidth',1);
plot(xx,zz(:,5),'k','LineWidth',1);
set(gca,'FontName','Times New Roman','FontSize',14);
xlabel('\it t','FontSize',14);
ylabel('\it R(t)','FontSize',14);
i = 30;
text(tt(i),RRs(i),['\it Genuine ME, CVTTF = ',num2str(real(cv(1)),4)],'FontName','Times New Roman','FontAngle','italic','FontSize',14);
text(xx(i),zz(i,2),['\it 2-Erlang, CVTTF = ',num2str(cv(2),4)],'FontName','Times New Roman','FontAngle','italic','FontSize',14);
text(xx(i),zz(i,3),['\it Exponential, CVTTF = ',num2str(cv(3),4)],'FontName','Times New Roman','FontAngle','italic','FontSize',14);
text(xx(i),zz(i,4),['\it 2-Coxian, CVTTF = ',num2str(cv(4),5)],'FontName','Times New Roman','FontAngle','italic','FontSize',14);
text(xx(i),zz(i,5),['\it 2-HE, CVTTF = ',num2str(cv(5),5)],'FontName','Times New Roman','FontAngle','italic','FontSize',14);
axis([0 150 0 1])

%% Hazard Function
figure('Name','Hazard Function');
plot(tt,hhs,'k','LineWidth',1); hold on
plot(xx,hh(:,2),'k','LineWidth',1);
plot(xx,hh(:,3),'k','LineWidth',1);
plot(xx,hh(:,4),'k','LineWidth',1);
plot(xx,hh(:,5),'k','LineWidth',1);
set(gca,'FontName','Times New Roman','FontSize',14);
xlabel('\it t','FontSize',14);
ylabel('\it h(t)','FontSize',14);
axis([0 200 0 0.2]);
i = 40;
text(tt(i),hhs(i),['\it Genuine ME, CVTTF = ',num2str(real(cv(1)),4)],'FontName','Times New Roman','FontAngle','italic','FontSize',14);
text(xx(i),hh(i,2),['\it 2-Erlang, CVTTF = ',num2str(cv(2),4)],'FontName','Times New Roman','FontAngle','italic','FontSize',14);
text(xx(i),hh(i,3),['\it Exponential, CVTTF = ',num2str(cv(3),4)],'FontName','Times New Roman','FontAngle','italic','FontSize',14);
text(xx(i),hh(i,4),['\it 2-Coxian, CVTTF = ',num2str(cv(4),5)],'FontName','Times New Roman','FontAngle','italic','FontSize',14);
text(xx(i),hh(i,5),['\it 2-HE, CVTTF = ',num2str(cv(5),5)],'FontName','Times New Roman','FontAngle','italic','FontSize',14);