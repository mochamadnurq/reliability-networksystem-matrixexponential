% ARPANET
% Plot R(t), h(t) with cv variation

clear
addpath('data');

load rt_ht_ttf_arpanet_pureme3.mat;
rr(:,1) = Rs';
zz(:,1) = z1';
hh(:,1) = z3';
cv(1)  = sdttf_component/mttf_component;
load rt_ht_ttf_arpanet_exponential.mat;
rr(:,2) = Rs';
zz(:,2) = z1';
hh(:,2) = z3';
cv(2)  = cvttfc_me;
load rt_ht_ttf_arpanet_2Coxian_cv1.5.mat;
rr(:,3) = Rs';
zz(:,3) = z1';
hh(:,3) = z3'; 
cv(3)  = cvttfc_me;
load rt_ht_ttf_arpanet_2Erlang.mat;
rr(:,4) = Rs';
zz(:,4) = z1';
hh(:,4) = z3'; 
cv(4)  = cvttfc_me;
load rt_ht_ttf_arpanet_FME_2Coxian_cv1.1391.mat;
rr(:,5) = Rs';
zz(:,5) = z1';
hh(:,5) = z3'; 
cv(5)  = cvttfc_me;

%%
figure('Name','Reliability Function');
PHLines = plot(xx,zz,'k','LineWidth',1);hold on;
ScLines = plot(t,rr,'ko','LineWidth',1);hold off;
PHGroup = hggroup;
ScGroup = hggroup;
set(gca,'FontName','Times New Roman','FontSize',14);
set(PHLines,'Parent',PHGroup);
set(ScLines,'Parent',ScGroup);
set(get(get(PHGroup,'Annotation'),'LegendInformation'),'IconDisplayStyle','on');
set(get(get(ScGroup,'Annotation'),'LegendInformation'),'IconDisplayStyle','on');
xlabel('\it t','FontSize',14);
ylabel('\it R(t)','FontSize',14);
title('Reliability Function','FontWeight','normal');
legend({'SDP with Reliability Function (proposed)','SDP with Reliability Values (baseline)'},'FontSize',14);
text(t(5),rr(5,1),['\it Genuine ME, CVTTF = ',num2str(real(cv(1)),4)],'FontName','Times New Roman','FontAngle','italic','FontSize',14);
text(t(5),rr(5,2),['\it Exponential, CVTTF = ',num2str(cv(2),4)],'FontName','Times New Roman','FontAngle','italic','FontSize',14);
text(t(5),rr(5,3),['\it 2-Coxian, CVTTF = ',num2str(cv(3),5)],'FontName','Times New Roman','FontAngle','italic','FontSize',14);
text(t(5),rr(5,4),['\it 2-Erlang, CVTTF = ',num2str(cv(4),4)],'FontName','Times New Roman','FontAngle','italic','FontSize',14);
text(t(5),rr(5,5),['\it 2-HE, CVTTF = ',num2str(cv(5),5)],'FontName','Times New Roman','FontAngle','italic','FontSize',14);
axis([0 tmax 0 1.2])

%%
figure('Name','Hazard Function');
PHLines = plot(xx,hh,'k','LineWidth',1);
PHGroup = hggroup;
set(gca,'FontName','Times New Roman','FontSize',14);
set(PHLines,'Parent',PHGroup);
set(get(get(PHGroup,'Annotation'),'LegendInformation'),'IconDisplayStyle','on');
xlabel('\it t','FontSize',14);
ylabel('\it h(t)','FontSize',14);
title('Hazard Function','FontWeight','normal');
axis([0 tmax 0 0.15]);
text(xx(70),hh(70,1),['\it Genuine ME, CVTTF = ',num2str(real(cv(1)),4)],'FontName','Times New Roman','FontAngle','italic','FontSize',14);
text(xx(70),hh(70,2),['\it Exponential, CVTTF = ',num2str(cv(2),4)],'FontName','Times New Roman','FontAngle','italic','FontSize',14);
text(xx(70),hh(70,3),['\it 2-Coxian, CVTTF = ',num2str(cv(3),5)],'FontName','Times New Roman','FontAngle','italic','FontSize',14);
text(xx(70),hh(70,4),['\it 2-Erlang, CVTTF = ',num2str(cv(4),4)],'FontName','Times New Roman','FontAngle','italic','FontSize',14);
text(xx(70),hh(70,5),['\it 2-HE, CVTTF = ',num2str(cv(5),5)],'FontName','Times New Roman','FontAngle','italic','FontSize',14);