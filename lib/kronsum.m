function Z = kronsum(X,Y)
Iy = speye(length(Y));
Ix = speye(length(X));
Z = kron(X,Iy)+kron(Ix,Y);

