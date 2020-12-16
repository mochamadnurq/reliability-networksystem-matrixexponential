% Function to generate PH representation of lifetime with n-Erlang
% distribution with specific lamda

function T = ph_nErlang(n,lamda)

T.a = sparse(1,n);
T.a(1) = 1;
T.A = sparse(n,n);
T.n = n;
for j = 1:n
    T.A(j,j) = -lamda;
    if j+1<= n
        T.A(j,j+1) = lamda;
    end
end

end

