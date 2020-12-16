% Compare Reliability Function Plot of scalar equation Weibull distribution
% and Acyclic PH3 described by Trivedi (2017)

clear
addpath('..\lib')

%% INPUT SECTION

% Maximum time for calculating R(t)
tmax = 25;  

% Number of points for R(t) values
s = 21;   

% Time vector
t = linspace(0,tmax,s); % time vector

% Component lifetime as ME distribution
T = me_3APH_Weibull();

% Component reliability function using symbolic representation
syms x
R_symbolic(x) = exp(-(0.1*x)^1.5); % Weibull distribution

%% MAIN PROGRAM

% Calculate reliability values using Symbolic
for i = 1:s
    R(i) = double(R_symbolic(t(i)));
end

% Calculate reliability values using ME distribution
for i = 1:s
    R_me(i) = T.a*expms(T.A*t(i))*T.v;
end

% Smoothing
[tt,RRme] = smoothing(t,R_me);

clear i s

%% PLOT
figure('Name','Reliability Function');
plot(tt,RRme,'k',t,R,'k--','LineWidth',1);
set(gca,'FontName','Times New Roman','FontSize',14);
legend({'Reliability function using PH (n = 3)','Reliability values using Weibull distribution'},'FontSize',13);
xlabel('\it t','FontSize',14);
ylabel('\it R(t)','FontSize',14);
axis([0 tmax 0 1.2])

