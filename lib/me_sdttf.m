function sdttf = me_sdttf(T)

mttf  = -T.a/T.A*T.v;
vttf  = 2*T.a/(T.A^2)*T.v-mttf^2;
sdttf = sqrt(vttf);

end

