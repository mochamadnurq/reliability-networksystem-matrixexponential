function cvttf = ph_cvttf(T)

mttf  = -sum(T.a/T.A);
vttf  = 2*sum(T.a/(T.A^2))-mttf^2;
svttf = sqrt(vttf);
cvttf = svttf/mttf;

end

