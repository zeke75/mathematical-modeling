%NLREG2: Matlab script M-file for analyzing the 
%data stored in systemregressiondata
load systemregressiondata
%Define the error
f1 = @(p) p(1)*exp(-p(2)*x1) + p(3)*exp(p(4)*x2);
f2 = @(p) p(5)*exp(-p(2)*x1) + p(6)*exp(p(4)*x2);
E = @(p) norm(y1-f1(p))^2 + norm(y2-f2(p))^2;
%Minimize the error with fminsearch
%For initial guess, get orders correct
p0 = [.01 .1 .01 .1 1 1];
[p Emin]=fminsearch(E,p0)
q = 2*length(y1)-length(p0);
sd = sqrt(Emin/q)
pause
%Break this up into an error for the first equation
%and an error for the second equation
E1=norm(y1-f1(p))^2
E2=norm(y2-f2(p))^2
pause
%
%Scale data and try again
w1 = max(abs(y1));
w2 = max(abs(y2));
E = @(p) (norm(y1-f1(p))/w1)^2 + (norm(y2-f2(p))/w2)^2;
%Minimize the error with fminsearch
[p Emin]=fminsearch(E,p0)
sd = sqrt(Emin/q)
%
y1sd = w1*sd
y2sd = w2*sd



