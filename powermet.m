function [v] = powermet(A,v)
%this is a simple-minded file the does one iteration with  
%the power method.
%it takes a vector `v' and a matrix  `A' of compatible dimensions,
%generates Av, computes the best eigenvalue lambda for
%Av=lambda v, and returns also the relative error
% norm(Av- lambda v)/norm(Av)

disp('the new approximate eigenvector is:')
w=A*v
disp('the new approximate eigenvalue is:')
lam=(w'*v)/(v'*v)
disp('the relative error norm(Av- lambda v)/norm(Av) is:')
error=norm(A*v-lam*v)/norm(A*v)
v=w;
end

