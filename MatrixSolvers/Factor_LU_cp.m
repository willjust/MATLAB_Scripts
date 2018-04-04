function [rp, cp, L, U ] = Factor_LU_cp(A)
%LUFACTOR O(m^3) factorization of a matrix A, bad stability
%   Performs LU Factorization on a matrix A and returns the Lower and Upper
%	matrix
%	Created 3/8/2017
[m,n] = size(A);
L = zeros(m); U = A;
rp=1:n;cp=1:n;
% i moves pivot to U(i,i)
for i = 1:m-1
	% Find max element in submatrix
	maxVal = U(i,i); maxCol = i; maxRow = i;
	for j = i:m
		for k = i:m
			if U(j,i) > maxVal
				maxVal = U(j,k);
				maxRow = j;
				maxCol = k;
			end
		end
	end
	% swap rows
	tmp = U(i,:); U(i,:)=U(maxRow,:); U(maxRow, :) = tmp;
	tmp = L(i,:); L(i,:)=L(maxRow,:); L(maxRow, :) = tmp;
	% swap columns
	%tmp = U(:,i); U(:,i)=U(:,maxCol); U(:,maxCol) = tmp;
	tmp = rp(i); rp(i) = rp(maxRow); rp(maxRow) = tmp;
	tmp = cp(i); cp(i) = cp(maxCol); cp(maxCol) = tmp;
	
	% j moves down m-i square matrix
	for j = i+1:n
		L(j,i) = U(j,i)/U(i,i);
		% k updates the rows of the submatrix
		% since symmetric, k only needs to do j:m instead of i:m as in 
		% standard LU Factorization. Since only the upper part of the 
		% symmetric submatrix is computed, the indices (U(j,k) = U(k,j)
		for k = i:m
			U(j,k) = U(j,k) - L(j,i)*U(i,k);
		end
	end
end
L = L+eye(n);

end

