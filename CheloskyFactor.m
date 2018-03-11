function [C] = CheloskyFactor(A)
if(norm(norm(A-A')) > 0)
	fprintf('Matrix is not symmetric, use other factorization');
end
[m,n] = size(A);
for i = 1:m
	for j = 1:n
		C
	end
end
end