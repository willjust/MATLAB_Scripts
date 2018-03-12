function [C] = Factor_Cholesky(A)
if(norm(norm(A-A')) > 0)
	fprintf('Matrix is not symmetric, use other factorization');
end
[m,~] = size(A);
C = zeros(m);
for i = 1:m % Rows
	for k = i:m % Cols
		if i == k
			C(k,i) = A(k,i);
			for j = 1:k-1
				C(k,k) = C(k,k) - C(k,j).^2;
			end
			C(i,k) = sqrt(C(i,k));
			continue
		end
		C(k,i) = A(k,i);
		for j = 1:i-1
			C(k,i) = C(k,i) - C(i,j)*C(k,j);
		end
		C(k,i) = C(k,i)/C(i,i);
	end
end
C=C';
end