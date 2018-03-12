function [y] = poly_eval(coefs, x)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
m = size(coefs,1);
y = zeros(size(coefs));
for i = 1:m
	ex = i-1;
	y = y+coefs(m-i+1).*x.^ex;
end

end

