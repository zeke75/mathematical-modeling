function systemregression3(x)
%SYSTEMREGRESSION3: MATLAB script M-file for analyzing the 
%data stored in systemregressiondata2. Computes means 
%along with error estimates
load systemregressiondata2
%Initial guess: GIVEN
p0 = [.01 .1 .01 .1 1 1];
%Scale
f1 = @(p) p(1)*x1.^p(2) + p(3)*exp(p(4)*x2);
f2 = @(p) p(5)*exp(p(4)*x1) + p(6)*x2.^p(2);
w1 = std(y1);
w2 = std(y2);
E = @(p) norm(y1-f1(p))^2/w1^2 + norm(y2-f2(p))^2/w2^2;
%Minimize the error with fminsearch
options=optimset('MaxFunEvals',1e6,'MaxIter',1e6);
[p Emin]=fminsearch(E,p0,options);
q = 2*length(y1)-length(p0);
s = sqrt(Emin/q);
%Error analysis
%Remember to work with scaled data and design matrices
F1 = [x1.^p(2) p(1)*x1.^p(2).*log(x1) exp(p(4)*x2) p(3)*exp(p(4)*x2).*x2 zeros(size(y1)) zeros(size(y1))];
F2 = [zeros(size(y1)) p(6)*x2.^p(2).*log(x2) zeros(size(y1)) p(5)*exp(p(4)*x1).*x1 exp(p(4)*x1) x2.^p(2)];
F = [F1/w1;F2/w2];
delz = [y1/w1;y2/w2]-[f1(p)/w1;f2(p)/w2];
delp = F\delz;
delmu1 = [x(1).^p(2) p(1)*x(1).^p(2).*log(x(1)) exp(p(4)*x(2)) p(3)*exp(p(4)*x(2)).*x(2) 0 0]*delp;
delmu2 = [0 p(6)*x(2).^p(2).*log(x(2)) 0 p(5)*exp(p(4)*x(1)).*x(1) exp(p(4)*x(1)) x(2).^p(2)]*delp;
%
y1f = @(p,x1,x2) p(1)*x1.^p(2)+p(3)*exp(p(4)*x2);
y2f = @(p,x1,x2) p(5)*exp(p(4)*x1)+p(6)*x2.^p(2);
%
mu1x = delmu1+y1f(p,x(1),x(2))
mu2x = delmu2+y2f(p,x(1),x(2))
%For 95% confidence interval
q = 2*length(y1)-length(p);
l = stut(q,.95);
fx1 = [x(1).^p(2) p(1)*x(1).^p(2).*log(x(1)) exp(p(4)*x(2)) p(3)*exp(p(4)*x(2)).*x(2) 0 0]/w1;
fx2 = [0 p(6)*x(2).^p(2).*log(x(2)) 0 p(5)*exp(p(4)*x(1)).*x(1) exp(p(4)*x(1)) x(2).^p(2)]/w2;
FL = (F'*F)\F';
a1 = FL'*fx1';
a2 = FL'*fx2';
c1 = norm(a1)^2;
c2 = norm(a2)^2;
slin = sqrt((norm(delz-F*delp)^2)/q); 
error1 = l*sqrt(slin^2*c1)*w1
error2 = l*sqrt(slin^2*c2)*w2