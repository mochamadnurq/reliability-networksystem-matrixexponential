% Reliability and Hazard Function of General System using Matrix approach
% with mix components

clear; addpath('..\lib');

%% INPUT SECTION

% Maximum time for plot R(t) and h(t)
tmax = 7;

% Number of points for R(t) and h(t) values
s    = 21;

% Time vector
t    = linspace(0,tmax,s);

% Number of components
N    = 8;

% Distribution of components lifetime, choose one:
% PH4
% T.a = [275/306,55/714,8/1071,2/119];
% T.A = sparse([-1,1,0,0;0,-1,1,0;0,0,-1,1;0,0,0,-9/2]);
% T.n = 4;

% ME3
T.a = [275/238,-55/238,9/119];
T.A = sparse([-1,1,0;0,-1,1;0,0,-1]);
T.n = 3;

% Pure ME3
% T.a = sparse([1,0,0]);
% T.A = [0,-2,2;3,2,-6;2,2,-5];
% T.n = 3;

%% MAIN PROGRAM

% Calculate MTTF and SDTTF of component
mttf_component  = ph_mttf(T)
cvttf_component = ph_cvttf(T)

% Generate PH representation of system
tic
for i = 1:N
    T_components(i) = T;    
end

V14  = phmin(T_components(1),T_components(4));
V134 = phmax(V14,T_components(3));
Z1   = phmin(V134,T_components(6));
V57  = phmin(T_components(5),T_components(7));
V578 = phmax(V57,T_components(8));
Z2   = phmin(V578,T_components(2));
T_system   = phmax(Z1,Z2);
time_generate_system = toc;

system_order = T_system.n

% Calculate MTTF and SDTTF of system
tic
mttf_system  = ph_mttf(T_system)
cvttf_system = ph_cvttf(T_system)
time_mttf_cvttf = time_generate_system+toc;

%%
% Calculate 21 points of reliability and hazard values using PH
time_21_points = time_generate_system;
for i = 1:s
    calculating_Rt_ht_point = i
    tic
    e     =  expms(T_system.A*t(i));
    Rs_ph(i) =  sum(T_system.a*e);
    hs_ph(i) = -sum(T_system.a*T_system.A*e)/Rs_ph(i);
    time_21_points  =  time_21_points+toc
end

%% Smoothing
[tt,RRs_ph] = smoothing(t,Rs_ph);
[tt,hhs_ph] = smoothing(t,hs_ph);

clear i e

% save data.mat

%%
figure('Name','Reliability Function');
plot(tt,RRs_ph,'k','LineWidth',1,'MarkerSize',10);
set(gca,'FontName','Times New Roman','FontSize',14);
xlabel('\it t','FontSize',14);
ylabel('\it R(t)','FontSize',14);

figure('Name','Hazard Function');
plot(tt,hhs_ph,'k','LineWidth',1,'MarkerSize',10);
set(gca,'FontName','Times New Roman','FontSize',14);
xlabel('\it t','FontSize',14);
ylabel('\it h(t)','FontSize',14);
% axis([0 tmax 0 0.08]);
