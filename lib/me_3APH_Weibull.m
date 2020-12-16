% Function to generate ME representation of lifetime with 
% 3-Acyclic PH distribution representing Weibull (beta,lambda)
% with beta = 1.5, lambda = 0.1

function T = me_3APH_Weibull()

% k      = 2210/243/100;
k      = 1;
T.n    = 3;
T.a    = sparse(1,T.n);
T.a(1) = 1;
T.A    = sparse(T.n,T.n);
T.A(1,1) = -0.270;
T.A(1,2) = 0.147;
T.A(1,3) = 0.099;
T.A(2,2) = -0.270;
T.A(2,3) = 0.270;
T.A(3,3) = -0.270;
T.A      = T.A*k;
T.v      = sparse(ones(T.n,1));

end