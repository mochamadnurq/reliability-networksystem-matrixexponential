function dp = nextstep(n,j,k,minproduct,product)
persistent result;

if j<k
    [mask,r,disjoint] = masking(n,j,product,minproduct);
    if disjoint
        nextstep(n,j+1,k,minproduct,product);
    else
        dproduct = product;
        for s = 1:r
            for i = 1:n
                if (product(i) == mask(s)) && (minproduct(j,i)<0) 
                    dproduct(i) = -1; 
                end
            end
            nextstep(n,j+1,k,minproduct,dproduct);
            for i = 1:n
                if product(i) == mask(s)
                    if minproduct(j,i) == 0
                        dproduct(i) = 0;
                    else
                        dproduct(i) = mask(s);
                    end
                end
            end  
        end
        for i = 1:n
            if (product(i)<0) && (minproduct(j,i) == 0)
                dproduct(i) = j;
                disjoint = 1;
            end
        end
        if disjoint
            nextstep(n,j+1,k,minproduct,dproduct);
        end 
    end
    dp = result;
else
    result = [result;product];
    dp = result;
end

end
        
