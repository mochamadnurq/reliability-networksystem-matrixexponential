% Table MTTF and CVTTF of the network

clear
addpath('data');

load rt_ht_ttf_arpanet_2Coxian_cv1.5.mat;
component_order = T(1).n;
component_mttf  = mttfc_me;
component_cvttf = cvttfc_me;
system_meorder  = system_order;
system_mttf     = mttfs_me;
system_cvttf    = cvttfs_me;

load rt_ht_ttf_arpanet_FME_2Coxian_cv1.1391.mat;
component_order = [component_order;T(1).n];
component_mttf  = [component_mttf;mttfc_me];
component_cvttf = [component_cvttf;cvttfc_me];
system_meorder  = [system_meorder;system_order];
system_mttf     = [system_mttf;mttfs_me];
system_cvttf    = [system_cvttf;cvttfs_me];

load rt_ht_ttf_arpanet_exponential.mat;
component_order = [component_order;T(1).n];
component_mttf  = [component_mttf;mttfc_me];
component_cvttf = [component_cvttf;cvttfc_me];
system_meorder  = [system_meorder;system_order];
system_mttf     = [system_mttf;mttfs_me];
system_cvttf    = [system_cvttf;cvttfs_me];

load rt_ht_ttf_arpanet_pureme3.mat;
component_order = [component_order;T(1).n];
component_mttf  = [component_mttf;mttfc_me];
component_cvttf = [component_cvttf;cvttfc_me];
system_meorder  = [system_meorder;system_order];
system_mttf     = [system_mttf;mttfs_me];
system_cvttf    = [system_cvttf;cvttfs_me];

load rt_ht_ttf_arpanet_2Erlang.mat;
component_order = [component_order;T(1).n];
component_mttf  = [component_mttf;mttfc_me];
component_cvttf = [component_cvttf;cvttfc_me];
system_meorder  = [system_meorder;system_order];
system_mttf     = [system_mttf;mttfs_me];
system_cvttf    = [system_cvttf;cvttfs_me];

load ttf_arpanet_3Erlang.mat;
component_order = [component_order;T(1).n];
component_mttf  = [component_mttf;mttfc_me];
component_cvttf = [component_cvttf;cvttfc_me];
system_meorder  = [system_meorder;system_order];
system_mttf     = [system_mttf;mttfs_me];
system_cvttf    = [system_cvttf;cvttfs_me];

load ttf_arpanet_4Erlang.mat;
component_order = [component_order;4];
component_mttf  = [component_mttf;mttfc_me];
component_cvttf = [component_cvttf;cvttfc_me];
system_meorder  = [system_meorder;system_order];
system_mttf     = [system_mttf;mttfs_me];
system_cvttf    = [system_cvttf;cvttfs_me];

load ttf_arpanet_5Erlang.mat;
component_order = [component_order;5];
component_mttf  = [component_mttf;mttfc_me];
component_cvttf = [component_cvttf;cvttfc_me];
system_meorder  = [system_meorder;system_order];
system_mttf     = [system_mttf;mttfs_me];
system_cvttf    = [system_cvttf;cvttfs_me];

Names = {'2-Coxian';'Full ME2';'Exponential';'Pure ME3';'2-Erlang';'3-Erlang';'4-Erlang';'5-Erlang'};
T = table(component_order,component_mttf,component_cvttf,system_meorder,system_mttf,system_cvttf,'RowNames',Names)