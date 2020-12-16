function MEs = me_system_generator(ME)

N   = length(ME);
MEs = ME(1);

for i = 2:N
    MEs.a = [MEs.a,ME(i).a];
    MEs.A = [MEs.A,sparse(MEs.n,ME(i).n);sparse(ME(i).n,MEs.n),ME(i).A];
    MEs.v = [MEs.v;ME(i).v];
    MEs.n = MEs.n+ME(i).n;
end

end

