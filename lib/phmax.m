function Ts = phmax(T1,T2)

u1  = sparse(ones(T1.n,1));
u2  = sparse(ones(T2.n,1));
I1  = speye(T1.n);
I2  = speye(T2.n);
z21 = sparse(T1.n,T1.n*T2.n);
z31 = sparse(T2.n,T1.n*T2.n);
z32 = sparse(T2.n,T1.n);
z23 = sparse(T1.n,T2.n);

Ts.a = [kron(T1.a,T2.a), (1-sum(T2.a))*T1.a, (1-sum(T1.a))*T2.a];
Ts.A = [kronsum(T1.A,T2.A)   kron(I1,-T2.A*u2)   kron(-T1.A*u1,I2);
        z21                  T1.A                z23           ;
        z31                  z32                 T2.A           ];
Ts.n = T1.n*T2.n+T1.n+T2.n;

end