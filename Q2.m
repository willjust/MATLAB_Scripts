function [C, e1, e2, e3] = Q2(A,x)
%Q2 Random function solely to meet requirements of CS513HW4
n = size(A,1);
C = norm(A)*norm(A^-1); % Calculates the conditioning of A
b = A*x; % Used to solve x = A\b
if issymmetric(A)
	%% Calculate e1 on symmetric matrix
	[L, U] = Factor_LU_sym(A);
	y = SolveLT(L,b);
	y = SolveUT(U,y);
	e1 = norm(x-y);
else 
	%% Calculate e1 (error of LU with no pivoting)
	[L, U] = Factor_LU(A);
	y = SolveLT(L,b);
	y = SolveUT(U,y);
	e1 = norm(x-y);
end
%% Calculate e2 (error of MATLAB LU)
[L,U,P] = lu(A);
b_temp = P*b;
y = SolveLT(L,b_temp);
y = SolveUT(U,y);
e2 = norm(x-y);
%% Calculate e3 (error of LU w/ pivoting)
[rp, cp, L, U] = Factor_LU_cp(A); % A(i,j) = A(rp(i), cp(j))
R = formEye(rp); D = formEye(cp); % Creates permuted identity matrix
b_temp = R*b; % Rearrange b given the row permutations
b_temp = SolveLT(L,b_temp); 
y = SolveUT(U,b_temp); y = D'*y; % rearrange y given the col. permutations
e3 = norm(x-y);
end

function x = SolveUT(R, b)
	n = size(b,1);
	x = zeros(n,1);
	for i = n:-1:1
	 x(i) = (b(i) - (R(i,i+1:end)*x(i+1:end)))/R(i,i);
	end
end
function x = SolveLT(R, b)
	n = size(b,1);
	x = zeros(n,1);
	for i = 1:1:n
	 x(i) = (b(i) - (R(i,1:i-1)*x(1:i-1)))/R(i,i);
	end
end
function [L, U] = Factor_LU(A)
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
			L(j,i) = U(j,i)/U(i,i);
			% k updates the rows of the submatrix
			for k = i:m
				U(j,k) = U(j,k) - L(j,i)*U(i,k);
			end
		end
	end
end
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
				if U(j,k) > maxVal
					maxVal = U(j,k);
					maxRow = j;
					maxCol = k;
				end
			end
		end
		% swap rows
		tmp = U(i,:); U(i,:)=U(maxRow,:); U(maxRow, :) = tmp;
		tmp = L(i,:); L(i,:)=L(maxRow,:); L(maxRow, :) = tmp;
		tmp = rp(i); rp(i) = rp(maxRow); rp(maxRow) = tmp;

		% swap columns
		tmp = U(:,i); U(:,i)=U(:,maxCol); U(:,maxCol) = tmp;
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
function A = formEye(shuffle) 
	A = zeros(size(shuffle',1));
	for i = 1:size(shuffle',1)
		A(i,shuffle(i)) = 1;
	end
end


