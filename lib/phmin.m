function Ts = phmin(T1,T2)

Ts.a = kron(T1.a,T2.a);
Ts.A = kronsum(T1.A,T2.A);
Ts.n = T1.n*T2.n;

end