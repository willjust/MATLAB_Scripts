function [output] = cs513f1(m,n,s)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
x1 = 1:m; x2 = 1:n; [X, Y] = meshgrid(x1,x2);

p = 1; o = 1;
vec = s*[p o]';
j = vec(1); k = vec(2);
i = 1;
while j < m
	while k < n
		output(1:2,i) = vec;
		i = i+1;
		vec = s*[p o]';
		j = vec(1);
		k = vec(2);
		p = p + 1;
	end
	o = o+1;
	p = 0;
end
end

