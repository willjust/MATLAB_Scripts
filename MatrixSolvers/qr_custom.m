function [A, v] = qr_custom(A)
[m,n] = size(A);
v = {n};

for k = 1:n
	x = A(k:m,k);
	v{k} = zeros(size(x));
	v{k}(1) = sign(x(1))*norm(x);
	v{k} = v{k} + x;
	v{k} = v{k}/norm(v{k});
	A(k:m,k:n) = A(k:m,k:n) - 2*v{k}*(v{k}'*A(k:m,k:n)); 
end
