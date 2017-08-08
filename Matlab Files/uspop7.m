%USPOP7: MATLAB script M-file that linearizes the 
%logistic model about best-fit parameters and 
%computes standardized residuals
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
M=F*((F'*F)\F');
q = length(dely)-length(p);     %degrees of freedom
s = sqrt(norm(dely'-F*delp)^2/q);
r = (dely'-F*delp)./(s*sqrt(1-diag(M)));
l = stut(q,.68);
%Predictions
pr = y(p,decades)'+F*delp;
plot(pr,r,'o',pr,-l*ones([1 length(pr)]),'r',pr,l*ones([1 length(pr)]),'r');
title('Standardized residuals vs. \mu_k','FontSize',15)
xlabel('Predictions')
ylabel('Standardized residuals r_k')