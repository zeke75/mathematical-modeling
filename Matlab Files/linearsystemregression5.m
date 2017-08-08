function linearsystemregression5(x)
%LINEARSYSTEMREGRESSION5: MATLAB script M-file for analyzing the 
%data stored in linearsystemregressiondata, scaling data
%Computes mu and error estimates
load linearsystemregressiondata
F1 = [ones(size(y1)) x1 x2 zeros(size(y1)) zeros(size(y1))];
F2 = [zeros(size(y1)) x2 zeros(size(y1)) ones(size(y1)) x1];
w1 = std(y1);
w2 = std(y2);
z = [y1/w1;y2/w2];
F = [F1/w1; F2/w2];
p = F\z;
%Compute mu
mu_x = [1 x(1) x(2) 0 0; 0 x(2) 0 1 x(1)]*p
%For 95% confidence interval
q = 2*length(y1)-length(p);
l = stut(q,.95);
fx1 = [1 x(1) x(2) 0 0]/w1;
fx2 = [0 x(2) 0 1 x(1)]/w2;
FL = (F'*F)\F';
a1 = FL'*fx1';
a2 = FL'*fx2';
c1 = norm(a1)^2;
c2 = norm(a2)^2;
ssq = (norm(z-F*p)^2)/q;
error1 = l*sqrt(ssq*c1)*w1
error2 = l*sqrt(ssq*c2)*w2



