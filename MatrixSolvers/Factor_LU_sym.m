function [ L, U ] = Factor_LU_sym(A)
%LUFACTOR O(m^3) factorization of a matrix A, bad stability
%   Performs LU Factorization on a matrix A and returns the Lower and Upper
%	matrix
%	Created 3/8/2017
[m,n] = size(A);
L = eye(m); U = A;

% i moves pivot to U(i,i)
for i = 1:m-1
	% j moves down m-i square matrix
	for j = i+1:n
		L(j,i) = U(i,j)/U(i,i);
		% k updates the rows of the submatrix
		% since symmetric, k only needs to do j:m instead of i:m as in 
		% standard LU Factorization. Since only the upper part of the 
		% symmetric submatrix is computed, the indices (U(j,k) = U(k,j)
		for k = j:m
			U(j,k) = U(j,k) - L(j,i)*U(i,k);
		end
	end
	U(i+1:end,i) = 0;
end


end

