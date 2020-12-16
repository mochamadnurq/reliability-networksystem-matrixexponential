% NETWORK WITHOUT BRIDGE
% Calculate R(t), h(t), MTTF, and CVTTF using SDP-JORDAN
% for several components

clear
addpath('..\lib');

%% INPUT SECTION

% Maximum time for calculating R(t) and h(t)
tmax = 4;  

% Number of points for R(t) and h(t) values
number_of_points = 21;   

% Time vector
t = linspace(0,tmax,number_of_points);

% Number of components
number_of_components = 8;   

% Distribution of components lifetime, choose one:
% Full PH3
T.a = sparse([1,0,0]);
T.A = [-6,4,2;2,-5,2;1,2,-4];
T.v = [1;1;1];
T.n = 3;

% Pure ME3
% T.a = sparse([1,0,0]);
% T.A = [0,-2,2;3,2,-6;2,2,-5];
% T.v = [1;1;1];
% T.n = 3;

% Network minproducts
minproduct(1,:) = [0,-1,-1,0,-1,0,-1,-1];   % X1X4X6
minproduct(2,:) = [-1,-1,0,-1,-1,0,-1,-1];  % X3X6
minproduct(3,:) = [-1,0,-1,-1,-1,-1,-1,0];  % X2X8
minproduct(4,:) = [-1,0,-1,-1,0,-1,0,-1];   % X2X5X7

%% MAIN PROGRAM
tic

% ME distribution of components lifetime
for i = 1:number_of_components
    T_components(i) = T;
end

% Transform component distribution to Jordan form
for i = 1:number_of_components
    T_components(i) = transform2jordan(T_components(i));
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

% Calculate MTTF and CVTTF Component with ME Approach
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
        R_components_values(i,j) = full(T_components(j).a*expms(T_components(j).A*t(i))*T_components(j).v);
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
plot(tt,R_system_me_smoothed_values,'k',t,R_system_values,'ko','LineWidth',1);
set(gca,'FontName','Times New Roman','FontSize',14);
xlabel('\it t','FontSize',14);
ylabel('\it R(t)','FontSize',14);
% axis([0 tmax 0 1]);

%%
figure('Name','Hazard Function');
plot(tt,h_system_me_smoothed_values,'k','LineWidth',1);
set(gca,'FontName','Times New Roman','FontSize',14);
xlabel('\it t','FontSize',14);
ylabel('\it h(t)','FontSize',14);
% axis([0 tmax 0 0.05]);