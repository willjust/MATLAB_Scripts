function x = QTX(tau, x)
m = size(tau,2);
for i=1:m
	x(i:end) = x(i:end) - 2*tau{i}*(tau{i}'*x(i:end));
end
