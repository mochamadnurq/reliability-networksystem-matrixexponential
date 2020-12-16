% Function to generate PH representation of lifetime with 
% 3-Coxian distribution with specific lamda

function T = me_3Coxian(p,q,lamda1,lamda2,lamda3)

n = 3;
T.a = sparse(1,n);
T.a(1) = 1;
T.A = sparse(n,n);
T.A(1,1) = -lamda1;
T.A(1,2) = p*lamda1;
T.A(2,2) = -lamda2;
T.A(2,3) = q*lamda2;
T.A(3,3) = -lamda3;
T.v = sparse(ones(n,1));
T.n = n;

end

