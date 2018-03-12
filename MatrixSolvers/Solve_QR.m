function [x] = Solve_QR(A, b)
%% Solves linear system Ax = b
%	Uses an efficient QR-Factorization scheme to find x = A\b
%	Never explicitly calculates Q, making algorithm fast
[R, v] = qr_custom(A);
x = QTX(v, b);
x = R\x;