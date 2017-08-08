function lvconf
%LVCONF: MATLAB function M-file for computing 95% confidence
%intervals for parameter estimates of the Lotka-Volterra
%model fit to the Hudson Bay data.
%Parameter values
lvdata;
y0 = [30.0;4.0];
a = .5482; b = .0283; c = .0265; r = .8369;
pbar = [a b c r];
[t ybar]=ode45(@lvrhs,years,y0,[],pbar);
dely = [H'; L'] - [ybar(:,1); ybar(:,2)];
%Set increment for derivative approximations
h = 1e-6;
[t ybar1]=ode45(@lvrhs,years,y0,[],[a+h b c r]);
[t ybar2]=ode45(@lvrhs,years,y0,[],[a b+h c r]);
[t ybar3]=ode45(@lvrhs,years,y0,[],[a b c+h r]);
[t ybar4]=ode45(@lvrhs,years,y0,[],[a b c r+h]);
F = [ybar1(:,1)-ybar(:,1) ybar2(:,1)-ybar(:,1) ybar3(:,1)-ybar(:,1) ybar4(:,1)-ybar(:,1); ...
    ybar1(:,2)-ybar(:,2) ybar2(:,2)-ybar(:,2) ybar3(:,2)-ybar(:,2) ybar4(:,2)-ybar(:,2)]/h;
delp = F\dely
pnew = pbar'+delp
%For 95% confidence interval for q=2(N-1)-4=36
l = 2.0281;
V = inv(F'*F);
ssq = (norm(dely-F*delp)^2)/36;
s = sqrt(ssq)
error = l*sqrt(ssq*diag(V))
%
function yprime = lvrhs(t,y,p)
a = p(1); b = p(2); c = p(3); r = p(4);
yprime = [a*y(1)-b*y(1)*y(2); -r*y(2)+c*y(1)*y(2)];