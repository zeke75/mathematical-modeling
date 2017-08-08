function uspop6(t)
%USPOP6: MATLAB function M-file that linearizes the 
%logistic model about best-fit parameters and 
%computes confidence intervals on the (nonlinear)
%least squares means
%
%Define data
uspop
%Define best-fit parameters
p(1) = .0208; p(2) = 486.8073; p(3) = 8.2242;
%Define logistic function and derivatives
y = @(p,t) p(2)*p(3)./(p(3)+(p(2)-p(3))*exp(-p(1)*t));
y_r = @(p,t) p(2)*p(3)*(p(2)-p(3))*t.*exp(-p(1)*t)./(p(3)+(p(2)-p(3))*exp(-p(1)*t)).^2;
y_K = @(p,t) p(3)^2*(1-exp(-p(1)*t))./(p(3)+(p(2)-p(3))*exp(-p(1)*t)).^2;
y_y0 = @(p,t) p(2)^2*exp(-p(1)*t)./(p(3)+(p(2)-p(3))*exp(-p(1)*t)).^2;
%
dely = pops-y(p,decades);
%Define the design matrix
F = [y_r(p,decades)' y_K(p,decades)' y_y0(p,decades)'];
%Compute the parameter differences
delp = F\dely';
%Pre-prediction
mu1 = [y_r(p,t) y_K(p,t) y_y0(p,t)]*delp;
%Prediction
mu_t = y(p,t)+mu1
%For 95% confidence interval
q = length(pops)-length(delp);
l = stut(q,.95);
ft = [y_r(p,t) y_K(p,t) y_y0(p,t)];
FL = (F'*F)\F';
a = FL'*ft';
c = norm(a)^2;
%Linear standard deviation
lsd = sqrt(norm(dely' - F*delp)^2/q);
error = l*sqrt(lsd*c)