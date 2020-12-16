function TME = transform2jordan(TPH)

[V,J] = jordan(TPH.A);
TME.a = sparse(TPH.a*V);
TME.A = sparse(V\TPH.A*V);
TME.v = sparse(V\TPH.v);
TME.n = TPH.n;

for i = 1:TME.n
    for j = 1:TME.n
        e = abs(TME.A(i,j));
        if e < 1e-5
            TME.A(i,j) = 0;
        end
    end
end

end

