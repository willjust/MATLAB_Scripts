function A = formEye(shuffle) 
	A = zeros(size(shuffle',1));
	for i = 1:size(shuffle',1)
		A(i,shuffle(i)) = 1;
	end
end
