function [sgn,out] = disjoint_expand(in)

n = length(in);
u = max(in);
b = 0;
sgn = [];
out = [];
bin = [];
for i = 1:u
    for j = 1:n
        if in(j)  ==  i
            b = b+1;
            I(b) = i;
            break;
        end
    end
end

for i = 1:b
    for k = 1:n
        if in(k)  ==  I(i)
            j = 0;
            c = 0;
            d = -1;
            while j<2^b
                if c<2^(i-1)
                    c = c+1;
                    j = j+1;
                    out(j,k) = d;
                else
                    c = 0;
                    if d == -1
                        d = 0;
                    else
                        d = -1;
                    end
                end
            end
        end
    end
end

for k = 1:n
    if in(k)  ==  0
        out(:,k) = 0;
    elseif in(k)  ==  -1
        out(:,k) = -1;
    end
end

for i = 1:b
    j = 0;
    c = 0;
    d = -1;
    while j<2^b
        if c<2^(i-1)
            c = c+1;
            j = j+1;
            bin(j,i) = d;
        else
            c = 0;
            if d == -1
                d = 0;
            else
                d = -1;
            end
        end
    end
end

y = size(bin);
if y(1)>1
    for j = 1:y(1)
        z = 0;
        for k = 1:y(2)
            if bin(j,k)  ==  0
                z = z+1;
            end
        end
        if mod(z,2)  ==  0
            sgn(j) = 1;
        else
            sgn(j) = -1;
        end
    end
else    
    sgn = 1;
end

end

