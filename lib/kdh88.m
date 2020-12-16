% DESCRIPTION
% Function to generate terms of structure function or Sum of Disjoint
% Products (SDP) terms of a network using KDH88 algorithm

% INPUT
% minproduct = minproduct list of a network

% OUTPUT
% SDP_terms = terms of structure function

function SDP_terms = kdh88(minproduct)

x = size(minproduct);
n = x(2);
m = x(1);

SDP_terms = [];
for k = 1:m
    product = minproduct(k,:);
    SDP_terms = nextstep(n,1,k,minproduct,product);
end

clear nextstep

end

