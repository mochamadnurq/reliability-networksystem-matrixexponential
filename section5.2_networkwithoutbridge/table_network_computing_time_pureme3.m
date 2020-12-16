% Table MTTF and CVTTF of the network

clear
addpath('data');

load phcp_pureme3_5points.mat
time_to_plot            = time_21_points*4;
time_to_calculate_ttf   = time_mttf_sdttf;

load mesdp_pureme3.mat
time_to_plot            = [time_to_plot;time_21_points];
time_to_calculate_ttf   = [time_to_calculate_ttf;time_mttf_sdttf];

load mesdpjordan_pureme3.mat
time_to_plot            = [time_to_plot;time_21_points];
time_to_calculate_ttf   = [time_to_calculate_ttf;time_mttf_sdttf];

Methods = {'Pure ME3-CP';'Pure ME3-SDP';'Pure ME3-SDPJORDAN'};
T = table(time_to_calculate_ttf,time_to_plot,'RowNames',Methods)