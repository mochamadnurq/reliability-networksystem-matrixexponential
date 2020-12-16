function [mask,r,disjoint] = mask(n,j,product,minproduct)

disjoint = 0; 
r = 0;
s = 1;
mask = 0;

while not(disjoint) && (s<j)
    b = 0;
    c = 0;
    
    for i = 1:n
        if product(i)  ==  s
            if minproduct(j,i)  ==  0
                b = 1;
            else
                c = 1;
            end
        end
    end
    
    if b
        if c
            r = r+1;
            mask(r) = s;
        else
            disjoint = 1;
        end
    end
    s = s+1;
%     for i = 1:n
%         for s = 1:(j-1)
%             if product(i)  ==  s
%                 k = k+1;
%                 pos(k) = i;    
%             end
%         end
%     end
%     
%     for m = 1:k
%         if minproduct(j,pos(m))  ==  0
%             b = b+1;
%         else
%             x = x+1;
%             mask(x) = pos(m);
%         end
%     end
%     
%     if b  ==  k
%         disjoint = 1;
%     else
%         break;
%     end

end

end




