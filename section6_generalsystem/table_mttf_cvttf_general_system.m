% Table MTTF and CVTTF of the network

clear
addpath('data');

load rt_ht_ttf_2Coxian_cv1.5.mat;
component_order = T(1).n;
component_mttf  = mttfc_me;
component_cvttf = cvttfc_me;
system_meorder  = system_order;
system_mttf     = mttfs_me;
system_cvttf    = cvttfs_me;

load rt_ht_ttf_fullme2_cv1.1391.mat;
component_order = [component_order;T(1).n];
component_mttf  = [component_mttf;mttfc_me];
component_cvttf = [component_cvttf;cvttfc_me];
system_meorder  = [system_meorder;system_order];
system_mttf     = [system_mttf;mttfs_me];
system_cvttf    = [system_cvttf;cvttfs_me];

load rt_ht_ttf_exponential.mat;
component_order = [component_order;T(1).n];
component_mttf  = [component_mttf;mttfc_me];
component_cvttf = [component_cvttf;cvttfc_me];
system_meorder  = [system_meorder;system_order];
system_mttf     = [system_mttf;mttfs_me];
system_cvttf    = [system_cvttf;cvttfs_me];

load rt_ht_ttf_2Erlang.mat;
component_order = [component_order;T(1).n];
component_mttf  = [component_mttf;mttfc_me];
component_cvttf = [component_cvttf;cvttfc_me];
system_meorder  = [system_meorder;system_order];
system_mttf     = [system_mttf;mttfs_me];
system_cvttf    = [system_cvttf;cvttfs_me];

load rt_ht_ttf_pureme3.mat;
component_order = [component_order;T(1).n];
component_mttf  = [component_mttf;mttfc_me];
component_cvttf = [component_cvttf;real(cvttfc_me)];
system_meorder  = [system_meorder;system_order];
system_mttf     = [system_mttf;real(mttfs_me)];
system_cvttf    = [system_cvttf;real(cvttfs_me)];

Names = {'2-Coxian';'Full ME2';'Exponential';'2-Erlang';'Pure ME3'};
T = table(component_order,component_cvttf,system_meorder,system_mttf,system_cvttf,'RowNames',Names)