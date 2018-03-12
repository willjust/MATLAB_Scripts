function Q = householderCalculator(A, w, i)
%% Computes the matrix Q given matrix A and vector w
% Computes the i-th-mth row of A given a vector w

m = size(A,1);

Q = zeros(m);
%Q(i:end,i:end) = A(i:end,i:end) - A(i:end,i:end)*2*w(i:end)*w(i:end)');

for j = i:m
	Q(j,:) = (A(:,j) - (2*w'*A(:,j)*w));
end
%Qa = A-2*A*w*w' = a - 2*w'*a*w
end