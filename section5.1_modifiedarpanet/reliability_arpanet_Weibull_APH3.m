% ARPA NETWORK
% Calculate R(t), h(t), MTTF, and CVTTF
% for Weibul distributed components

clear
addpath('..\lib');
%% INPUT SECTION

% Maximum time for calculating R(t) and h(t)
tmax = 25;  

% Number of points for R(t) and h(t) values
number_of_points = 21;   

% Time vector
t = linspace(0,tmax,number_of_points);

% Number of components
number_of_components = 9;   

% Components lifetime distribution using ME representation
T = me_3APH_Weibull();

% Network minproducts
arpanet_minproducts

% Component reliability function using symbolic representation
syms x
R_component(x) = exp(-(0.1*x)^1.5); % Weibull distribution

%% MAIN PROGRAM
tic

% ME distribution of components lifetime
for i = 1:number_of_components
    T_components(i) = T;
end

% Generate SDP terms from minproducts using KDH88 algorithm
SDP_terms = kdh88(minproduct);
[const,R_terms] = generate_R_terms_from_sdp_terms(SDP_terms);

% Generate ME representation of each SDP terms
ME = me_generator_from_sdp_terms(SDP_terms,T_components);

% Generate ME representation of network
T_system = me_system_generator(ME);

time_generate_system = toc

system_order  = T_system.n

% Calculate MTTF and CVTTF Component using ME representation of component
mttf_component  = me_mttf(T_components(1))
cvttf_component = me_cvttf(T_components(1))

% Calculate MTTF and CVTTF System using ME representation of the system
% tic
% mttf_system  = me_mttf(T_system)
% cvttf_system = me_cvttf(T_system)
% time_mttf_cvttf = time_generate_system+toc

% Calculate MTTF and CVTTF System using ME representation of each SDP term
tic
mttf_system  = me_mttf_blocks(ME)
cvttf_system = me_cvttf_blocks(ME)
time_mttf_cvttf = time_generate_system+toc

% Calculate reliability values of components Rj
for j = 1:number_of_components
    for i = 1:number_of_points
        R_components_values(i,j) = double(R_component(t(i)));
    end
end

% Calculate reliability values of system
for i = 1:number_of_points
    R_system_values(i) = 0;
    for h = 1:size(R_terms,1)
        Rx = 1;
        for j = 1:size(R_terms,2)
            if R_terms(h,j) == 0
                Rx = Rx*R_components_values(i,j);
            end
        end
        R_system_values(i) = R_system_values(i)+const(h)*Rx;
    end
end

% Calculate reliability and hazard function using ME representation of 
% each SDP term
time_plot_rt_ht = time_generate_system;
number_of_me_blocks = length(ME);
for i = 1:number_of_points
    calculating_Rt_ht_point = i
    tic
    c = 0;
    d = 0;
    for j = 1:number_of_me_blocks
        ev = expms(ME(j).A*t(i))*ME(j).v;
        c  = c+ME(j).a*ev;
        d  = d+ME(j).a*ME(j).A*ev;
    end
    R_system_me_values(i) =  c;
    h_system_me_values(i) = -d/c;
    time_plot_rt_ht = time_plot_rt_ht+toc
end

% Smoothing
[tt,R_system_me_smoothed_values] = smoothing(t,R_system_me_values);
[tt,h_system_me_smoothed_values] = smoothing(t,h_system_me_values);

clear c d h i j ev Rx ME T_system

save data.mat

%% 
figure('Name','Reliability Function');
plot(tt,R_system_me_smoothed_values,'k',t,R_system_values,'k--','LineWidth',1);
set(gca,'FontName','Times New Roman','FontSize',14);
legend({'SDP for reliability function using PH (n = 3)','SDP for reliability values using Weibull distribution'},'FontSize',13);
xlabel('\it t','FontSize',14);
ylabel('\it R(t)','FontSize',14);
axis([0 tmax 0 1.2]);

%%
figure('Name','Hazard Function');
plot(tt,h_system_me_smoothed_values,'k','LineWidth',1);
set(gca,'FontName','Times New Roman','FontSize',14);
xlabel('\it t','FontSize',14);
ylabel('\it h(t)','FontSize',14);
% axis([0 tmax 0 0.05]);