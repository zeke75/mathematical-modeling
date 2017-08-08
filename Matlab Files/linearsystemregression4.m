%LINEARSYSTEMREGRESSION4: MATLAB script M-file for analyzing the 
%data stored in linearsystemregressiondata, scaling data.
%Computes parameter estimates and error estimates.
load linearsystemregressiondata
F1 = [ones(size(y1)) x1 x2 zeros(size(y1)) zeros(size(y1))];
F2 = [zeros(size(y1)) x2 zeros(size(y1)) ones(size(y1)) x1];
w1 = std(y1);
w2 = std(y2);
z = [y1/w1;y2/w2];
F = [F1/w1;F2/w2];
p = F\z
%
%Standard deviations
q = 2*length(y1)-length(p);
s = sqrt(norm(z-F*p)^2/q)
s1 = s*w1
s2 = s*w2
%For 95% confidence intervals
l = stut(q,.95);
V = inv(F'*F);
error = l*sqrt(s^2*diag(V))