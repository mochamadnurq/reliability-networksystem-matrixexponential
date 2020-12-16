function Ts = meadd(T1,T2)

Ts.a = [T1.a sparse(1,T2.n)];
Ts.A = [T1.A                 -T1.A*T1.v*T2.a;
        sparse(T2.n,T1.n)          T2.A   ];
Ts.v = [T1.v;T2.v];
Ts.n = T1.n+T2.n;

end