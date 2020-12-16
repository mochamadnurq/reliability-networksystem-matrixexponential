% Table MTTF and CVTTF of the network

clear
addpath('data');

load phcp_cyclicph3_2points.mat
time_to_plot            = time_21_points*20;
time_to_calculate_ttf   = time_mttf_sdttf;

load mesdp_cyclicph3_2points.mat
time_to_plot            = [time_to_plot;time_21_points*20];
time_to_calculate_ttf   = [time_to_calculate_ttf;time_mttf_sdttf];

load mesdpjordan_cyclicph3.mat
time_to_plot            = [time_to_plot;time_21_points];
time_to_calculate_ttf   = [time_to_calculate_ttf;time_mttf_sdttf];

Methods = {'Cyclic PH3-CP';'Cyclic PH3-SDP';'Cyclic PH3-SDPJORDAN'};
T = table(time_to_calculate_ttf,time_to_plot,'RowNames',Methods)