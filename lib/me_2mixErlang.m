% Function to generate PH representation of lifetime with 
% 2-mixture Erlang Exponential distribution with specific lamda

function T = me_2mixErlang(lamda)

n = 2;
T.a = sparse(1,n);
T.a(1) = 0.5;
T.a(2) = 0.5;
T.A = sparse(n,n);
T.n = n;
for j = 1:n
    T.A(j,j) = -lamda;
    if j+1<= n
        T.A(j,j+1) = lamda;
    end
end
T.v = sparse(ones(n,1));

end

