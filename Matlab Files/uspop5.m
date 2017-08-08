%USPOP5: MATLAB script M-file that linearizes the 
%logistic model about best-fit parameters and 
%computes confidence intervals on the (nonlinear)
%least squares coefficients
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
dely = pops-y(p,decades)
%Define the design matrix
F = [y_r(p,decades)' y_K(p,decades)' y_y0(p,decades)']
%Compute the parameter differences
delp = F\dely'
%Compute the parameter values
params=p'+delp
%Degrees of freedom
q = length(pops)-length(delp);
%Linear standard deviation
lsd = sqrt(norm(dely' - F*delp)^2/q)
%For 95% confidence interval
l = stut(q,.95);
V = inv(F'*F);
error = l*sqrt(lsd^2*diag(V))
pause
clear y_r y_K y_y0;
%Alternative, numerical approach
%
%Choose an increment for derivative approximation
h=1e-4;
y_r=(y(p+[h 0 0],decades)-y(p,decades))/h;
y_K=(y(p+[0 h 0],decades)-y(p,decades))/h;
y_y0=(y(p+[0 0 h],decades)-y(p,decades))/h;
F = [y_r' y_K' y_y0']
%From here, proceed as before