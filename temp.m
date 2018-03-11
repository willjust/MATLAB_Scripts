A = [2 -2; 1 1];

% Part 1, Eigenvalues of A
fprintf('Question 1\n');
fprintf('Eigenvalues of A:');
eig(A)

sprectralRadius = max(abs(eig(A)))

% Partb, norms of A
norm1 = norm(A,1)
norm2 = norm(A)
norminf = norm(A,inf)

% Part c, SVD of A
singVals = svd(A)
U = [1 0; 0 1]; V = ones(2)*1/sqrt(2); V(1,1) = -V(1,1);
sig = [8 0; 0 2];
U
sig
V
check = U*sqrt(sig)*V'

%% Question 2
% Part 1
fprintf('\n\nQuestion 2\n')
N = 6;
d = 10*rand(6,1); % The diagonal values
t = triu(bsxfun(@min,d,d.').*rand(N),1); % The upper trianglar random values
A = diag(d)+t+t.'; % Put them together in a symmetric matrix
[V, D] = eig(A*A');
[V2, D2] = eig(A);
eigValues = D - D2.^2
eigVectors = abs(V2)- abs(V)

%% Question 4
% using QR algorithm produced for assignment 2
fprintf('\n\nQuestion 4.\n');
Z = [1 2 3; 4 5 6; 7 8 7; 4 2 3; 4 2 2];
[Q,R] = qr_bad(Z);

error = norm(Z-Q*R)

%% Question 5
fprintf('\n\nCustom QR Factorization O(n^2)\n')
A1 = rand(10);
A2 = rand(10);
b = rand(10,1);
x_act1 = A1\b;
x_act2 = A2\b;
[R1, tau1] = qr_custom(A1);
[R2, tau2] = qr_custom(A2);
% Using default matlab for Rx=y but could make a trivial solver since R i
% diagonal
x_cust1 = R1\(QTX(tau1, b));
x_cust2 = R2\(QTX(tau2, b));
error1 = norm(x_act1-x_cust1)
error2 = norm(x_act2-x_cust2)
