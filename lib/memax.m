function Ts = memax(T1,T2)
z12 = sparse(T1.n*T2.n,T1.n);
z13 = sparse(T1.n*T2.n,T2.n);
z21 = sparse(T1.n,T1.n*T2.n);
z31 = sparse(T2.n,T1.n*T2.n);
z32 = sparse(T2.n,T1.n);
z23 = sparse(T1.n,T2.n);
Ts.a = [-kron(T1.a,T2.a) T1.a T2.a];
Ts.A = [kronsum(T1.A,T2.A)      z12          z13;
        z21                     T1.A         z23;
        z31                     z32          T2.A];
Ts.v = [kron(T1.v,T2.v); T1.v; T2.v];
Ts.n = T1.n*T2.n+T1.n+T2.n;    
end