function T = me_nErlang(n,lambda)

% FUNCTION T = me_nErlang(n,lambda)
% Function to generate ME representation of lifetime with n-Erlang
% distribution with specific lambda

T.a = sparse(1,n);
T.a(1) = 1;
T.A = sparse(n,n);
for j = 1:n
    T.A(j,j) = -lambda;
    if j+1<= n
        T.A(j,j+1) = lambda;
    end
end
T.v = ones(n,1);
T.n = n;

end

