function [A] = UDLS_Make_A(T,j)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
ex = j:-1:0;
A = T.^ex;
end

