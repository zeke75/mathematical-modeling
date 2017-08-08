%NLREG1: Matlab script M-file for analyzing the 
%data stored in nlregdata1
%Data has the form y, x1, x2
load nlregdata1
%First, carry out a linear fit of a transformed equation
%log y = log p1 + p2 log x1 + p3 x2
F = [ones(size(y)) log(x1) x2];
ptemp = F\log(y)
p0 = [exp(ptemp(1)) ptemp(2) ptemp(3)]
%
%Define the error
E = @(p) norm(y-p(1)*x1.^p(2).*exp(p(3)*x2))^2;
%Minimize the error with fminsearch
[p Emin]=fminsearch(E,p0)
q = length(y)-length(p);
sd = sqrt(Emin/q)

