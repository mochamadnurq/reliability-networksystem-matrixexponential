function Ts = memin(T1,T2)

Ts.a = [kron(T1.a,T2.a)];
Ts.A = [kronsum(T1.A,T2.A)];
Ts.v = [kron(T1.v,T2.v)];
Ts.n = T1.n*T2.n;

end
    