function vttf = me_vttf_blocks(ME)

n = length(ME);
mttf = 0;
vttf = 0;
for i = 1:n
    mttf = mttf-ME(i).a/ME(i).A*ME(i).v;
    vttf = vttf+2*ME(i).a/(ME(i).A^2)*ME(i).v;
end
vttf = vttf-mttf^2;

end

