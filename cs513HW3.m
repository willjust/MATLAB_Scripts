%testing place

A = [1 2 3; 4 5 6; 7 8 9]; b = [1 0 1]';
A/b
%% Question 2, ME513HW3
l = 10; dx = 0.01; xx = -l:dx:l;
f = @(x) x.^2 .* exp(-3.*x.^2) + (x/40).^2;
df1 = @(x) (f(x+dx) - f(x-dx))/dx/2;
df2 = @(x) (f(x+dx)+f(x-dx) - 2*f(x))/dx^2;
clf; hold on; figure(1); 
plot(xx,f(xx)); plot(xx,df1(xx)); plot(xx,df2(xx)); title('Q2.') 
legend('F(x)', 'DF(x)/Dx', 'D^2F(x)/Dx^2'); axis tight; xlabel('x');

%% Question 5, Cholesky Factorization
clf; clc; close all;
