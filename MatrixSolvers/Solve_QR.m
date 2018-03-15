function [x] = Solve_QR(A, b)
[m, n] = size(A);
R = A;
for i = 1:n
 x = R(:,i);
 y = [x(1:i-1)' norm(x(i:m)) zeros(1, m-i)]';
 w = x-y;
 if norm(w) ~= 0
 w = w/norm(w);
 end
 R = R - 2*w*(w'*R);
 b = b - 2*w*(w'*b);
end
R
x = zeros(n,1);
for i = n:-1:1
 x(i) = (b(i) - (R(i,i+1:end)*x(i+1:end)))/R(i,i);
end

%% Solves linear system Ax = b
%	Uses an efficient QR-Factorization scheme to find x = A\b
%	Never explicitly calculates Q, making algorithm fast
% [m, ~] = size(A);
% [R, v] = qr_custom(A);
% x = QTX(v, b);
% R
% for i = m-1:-1:1
%  x(i) = (x(i) - ...
% 	 (R(i,i+1:end)*x(i+1:end)))/R(i,i);
% end
