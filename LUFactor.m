function [ L, U ] = LUFactor(A)
%LUFACTOR O(m^3) factorization of a matrix A, bad stability
%   Performs LU Factorization on a matrix A and returns the Lower and Upper
%	matrix
%	Created 3/8/2017
[m,n] = size(A);
L = eye(m); U = A;

for i = 1:m-1
	for j = i+1:n
		L(j,i) = U(j,i)/U(i,i);
		for k = i:m
			U(j,k) = U(j,k) - L(j,i)*U(i,k);
		end
	end
end


end

