%SYSTEMREGRESSION2: MATLAB script M-file for analyzing the 
%data stored in systemregressiondata2. Computes parameter
%values and error estimates.
load systemregressiondata2
%Initial guess: GIVEN
p0 = [.01 .1 .01 .1 1 1];
%Scaled Error
f1 = @(p) p(1)*x1.^p(2) + p(3)*exp(p(4)*x2);
f2 = @(p) p(5)*exp(p(4)*x1) + p(6)*x2.^p(2);
w1 = std(y1);
w2 = std(y2);
E = @(p) norm(y1-f1(p))^2/w1^2 + norm(y2-f2(p))^2/w2^2;
%Minimize the error with fminsearch.
%Note the use of options.
options=optimset('MaxFunEvals',1e6,'MaxIter',1e6);
[p Emin]=fminsearch(E,p0,options)
q = 2*length(y1)-length(p0);
s = sqrt(Emin/q)
%
s1 = s*w1
s2 = s*w2
%
%Error analysis
%Remember to work with scaled data and design matrices
F1 = [x1.^p(2) p(1)*x1.^p(2).*log(x1) exp(p(4)*x2) p(3)*exp(p(4)*x2).*x2 zeros(size(y1)) zeros(size(y1))];
F2 = [zeros(size(y1)) p(6)*x2.^p(2).*log(x2) zeros(size(y1)) p(5)*exp(p(4)*x1).*x1 exp(p(4)*x1) x2.^p(2)];
F = [F1/w1;F2/w2];
delz = [y1/w1;y2/w2]-[f1(p)/w1;f2(p)/w2];
delp = F\delz
pnew = p'+delp
slin = sqrt(norm(delz-F*delp)^2/q) %Compare s and slin
%For 95% confidence intervals
l=stut(q,.95);
V = inv(F'*F);
error = l*sqrt(s^2*diag(V))