% Generate ME representation of 2-Coxian distribution
% INPUT
%  mean : desired mean
%  c    : desired coefficient of variation
%  N    : number of array of output
% OUTPUT
%  T    : ME representation of 2-Coxian

function T = me_2Coxian(c,mean)

n   = 2;
r   = 1/(c^2-sqrt(c^4-1));
p   = (1-c^4+c^2*sqrt(c^4-1))/(c^2+1);
mu2 = (1/r+p)/mean;
mu1 = r*mu2;

T.a   = sparse(1,n);
T.a(1) =  1;
T.A   = sparse(n,n);
T.A(1,1) = -mu1;
T.A(2,2) = -mu2;
T.A(1,2) = p*mu1;
T.v = ones(n,1);
T.n = n;

end