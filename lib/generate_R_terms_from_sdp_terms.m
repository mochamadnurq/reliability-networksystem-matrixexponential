% DESCRIPTION
% Function to generate reliability terms from SDP terms

% INPUT
% SDP_terms

% OUTPUT
% c         = sign of reliability function terms in variable 'R_terms'
% R_terms   = terms of reliability function

function [c,R_terms] = generate_R_terms_from_sdp_terms(SDP_terms)

v = size(SDP_terms);
R_terms = [];
c = [];
for i = 1:v
    in = SDP_terms(i,:);
    [sgn,out] = disjoint_expand(in);
    R_terms = [R_terms;out];
    c = [c,sgn];
end

R_terms_dimension = size(R_terms)

% Convert each row i in R_terms to decimal number
% by changing -1 to 0 and 0 to 1
% then save the decimal number as R_terms_dec(i)
for i = 1:size(R_terms,1)
    X = 0;
    for j = 1:size(R_terms,2)
        if R_terms(i,j) == 0
            X = X+2^(j-1);
        end
    end
    R_terms_dec(i) = X;
end

% Check similar row in R_terms through its decimal value
% then merge the rows and also its cant
% then give mark the merged row with zero decimal number
i = 2;
while i <= size(R_terms,1)
    for j = 1:i-1
        if R_terms_dec(i) == R_terms_dec(j)
            c(j)   = c(j)+c(i);
            R_terms_dec(i) = 0;
        end
    end
    i = i+1;
end

% Find row number of the merged rows marked by zero decimal value
% and save it as del_pos
del_pos = [];
j = 1;
for i = 1:length(R_terms_dec)
    if R_terms_dec(i) == 0
        del_pos(j) = i;
        j = j+1;
    end
end

% Delete merged row as in del_pos
i = 1;
number_of_deletion = length(del_pos)
while i <= number_of_deletion
    R_terms_dec(del_pos(i)) = [];
    R_terms(del_pos(i),:)   = [];
    c(del_pos(i))           = [];
    del_pos                 = del_pos - 1;
    i = i+1;
end

end


