% Function to generate PH representation of lifetime with 
% 4-Acyclic PH distribution representing Weibull (beta,lambda)
% with beta = 1.5, lambda = 0.1

function T = me_4APH_Weibull()

% k      = 2249/249/100;
k      = 1;
T.n    = 4;
T.a    = sparse(1,T.n);
T.a(1) = 1;
T.A    = sparse(T.n,T.n);
T.A(1,1) = -0.339;
T.A(1,2) = 0.169;
T.A(1,3) = 0.004;
T.A(1,4) = 0.154;
T.A(2,2) = -0.323;
T.A(2,3) = 0.323;
T.A(3,3) = -0.323;
T.A(3,4) = 0.323;
T.A(4,4) = -0.326;
T.A      = T.A*k;
T.v      = sparse(ones(T.n,1));

end