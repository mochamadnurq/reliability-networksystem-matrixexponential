% Table MTTF and CVTTF of the network

clear
addpath('data');

load phcp_ph4.mat
time_to_plot            = time_21_points;
time_to_calculate_ttf   = time_mttf_sdttf;

load mesdp_ph4.mat
time_to_plot            = [time_to_plot;time_21_points];
time_to_calculate_ttf   = [time_to_calculate_ttf;time_mttf_sdttf];

load phcp_me3.mat
time_to_plot            = [time_to_plot;time_21_points];
time_to_calculate_ttf   = [time_to_calculate_ttf;time_mttf_sdttf];

load mesdp_me3.mat
time_to_plot            = [time_to_plot;time_21_points];
time_to_calculate_ttf   = [time_to_calculate_ttf;time_mttf_sdttf];

Methods = {'PH4-CP';'PH4-SDP';'ME3-CP';'ME3-SDP';};
T = table(time_to_calculate_ttf,time_to_plot,'RowNames',Methods)