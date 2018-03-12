function [x] = UDLS( func, interval, m,k)
% UDLS - performs underdetermined least squares to approx. func
%	func - function to approximate
%	interval - interval to approximate function [x_begin, x_end]
%	m - number of points to approximate
%	k - degreee of polynomial fit
%	returns coefficients for polynomial fit
T = linspace(interval(1), interval(2), m)';
A = UDLS_Make_A(T,k);
b = func(T);
x = Solve_QR(A,b);

