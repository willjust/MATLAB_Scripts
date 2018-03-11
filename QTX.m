function x = QTX(tau, x)
[~, n] = size(tau);
m = size(tau{1},1);
for i=1:m
	x(i:m) = x(i:m) - 2*tau{i}*(tau{i}'*x(i:m));
end
