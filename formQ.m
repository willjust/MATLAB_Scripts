function Q = formQ(tau) 
[~, n] = size(tau);
if (n==0), return, end
m = size(tau{1}, 1);
Q = eye(m);
for i = 1:n
	v = zeros(1,m);
	v(i:m) = tau{i};
	Q = Q-2*v*(v'*Q);
end
