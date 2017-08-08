function lvconf1
%LVCONF1: MATLAB function M-file for computing 95% confidence
%intervals for parameter estimates of the Lotka-Volterra
%model fit to the Hudson Bay data.
%Scaling is not used.
lvdata;
y0 = [30.0;4.0];
a = .5482; b = .0283; c = .0265; r = .8369;
pbar = [a b c r];
[t ybar]=ode45(@lvrhs,years,y0,[],pbar);
dely = [H'; L'] - [ybar(:,1); ybar(:,2)];
%NOTE: For t=0 dely=0, because this isn't really a data 
%point; it's fairly easy to show that we get the same result
%with this 0 equation that we would get if we worked 
%with H(2:end) etc.
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
%For 95% confidence
q = 2*(length(H)-1)-length(delp);
l = stut(q,.95);
V = inv(F'*F);
ssq = (norm(dely-F*delp)^2)/q;
s = sqrt(ssq)
error = l*sqrt(ssq*diag(V))
%
function yprime = lvrhs(t,y,p)
a = p(1); b = p(2); c = p(3); r = p(4);
yprime = [a*y(1)-b*y(1)*y(2); -r*y(2)+c*y(1)*y(2)];