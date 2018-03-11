function [Q,R] = QRFactor(A)
m = size(A,1);

Q = eye(m);
for i = 1:m
	x = A(i,i:end);
	y = zeros(m,1);
	y(1:i-1) = A(i,1:i-1);
	y(i) = norm(x(i:end));
	w = x-y;
	w = w / norm(w);
	H = eye(m) - 2*(w*w');
	A = H*A;
	Q = H*Q;
end
R = Q'*A;

end