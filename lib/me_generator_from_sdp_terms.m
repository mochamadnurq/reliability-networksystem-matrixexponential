% DESCRIPTION
% Function to generate ME representation of each term of reliability
% function generated from KDH88

% INPUT
% sdp = terms of disjoint products
% X   = ME representation of components reliability function

% OUTPUT
% ME  = Reliability function of each terms represented with ME

% EXAMPLE
% Given input: Xs = X1X2 + X1*negation(X3) + X1*negation(X2X3)
% This function will give ME representation of each term: 
% X1X2, X1*(1-X3), X1*(1-X2X3)

function ME = me_generator_from_sdp_terms(sdp,X)

x = size(sdp);

for i = 1:x(1)
    for j =1:x(2)
        k = sdp(i,j);
        if k ~= -1
            Z(k+1).a = 1;
            Z(k+1).A = 0;
            Z(k+1).v = 1;
            Z(k+1).n = 1;
        end
    end
    for j = 1:x(2)
        k = sdp(i,j);
        if k ~= -1
            Z(k+1).a = kron(Z(k+1).a,X(j).a);
            Z(k+1).A = kronsum(Z(k+1).A,X(j).A);
            Z(k+1).v = kron(Z(k+1).v,X(j).v);
            Z(k+1).n = Z(k+1).n*X(j).n;
        end   
    end
    Y = Z(1);
    for j = 1:(length(Z)-1)
        if Z(j+1).n ~= 0
            Y.a = [Y.a, -kron(Y.a,Z(j+1).a)];
            Y.A = [Y.A, sparse(Y.n,Y.n*Z(j+1).n); sparse(Y.n*Z(j+1).n,Y.n), kronsum(Y.A,Z(j+1).A)];
            Y.n = Y.n+Y.n*Z(j+1).n;
            Y.v = [Y.v; kron(Y.v,Z(j+1).v)];
        end
    end
    ME(i).a = Y.a;
    ME(i).A = Y.A;
    ME(i).v = Y.v;
    ME(i).n = Y.n;
    clear Z Y
end

end

