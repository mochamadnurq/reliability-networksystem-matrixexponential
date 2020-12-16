function mttf = me_mttf_blocks(ME)

n = length(ME);
mttf = 0;
for i = 1:n
    mttf = mttf-ME(i).a/ME(i).A*ME(i).v;    
end

end

