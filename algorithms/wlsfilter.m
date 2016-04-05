function [u] = wlsfilter(g,f,nei,lambda,sigma)

[X, Y, Zg]=size(g);  N = X*Y;
[~, ~, Zf]=size(f);  

[~, edges] = lattice(X,Y,nei);

fVals = reshape(f,N,Zf);
F = double(fVals);

if Zg > 1, g = colorspace('Lab<-', g);end;
gVals = reshape(g,N,Zg);
weights = makeweightsL2(edges,gVals,sigma);
W = adjacency(edges,weights,N);

C = sparse(1:N,1:N,ones(N,1));
D = sparse(1:N,1:N,sum(W));
L = D-W;
R = (C+lambda*L);

U = (R \ F);
u = reshape(U,X,Y,Zf);

fprintf(1,'lambda: %d',lambda);fprintf('\n');