function vttf = me_vttf(T)

mttf = -T.a/T.A*T.v;
vttf = 2*T.a/(T.A^2)*T.v-mttf^2;

end

