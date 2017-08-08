% Problem 5c
function sirconf

days=[0 3 4 5 6 7 8 9 10 11 12 13 14];
S=[762 740 650 400 250 120 80 50 20 18 15 13 10];
I=[1 20 80 220 300 260 240 190 120 80 20 5 2];

y0 = [762;1];
a = .0022; b = .4361;
pbar = [a b];
[t ybar]=ode45(@sirrhs,days,y0,[],pbar);
dely = [S'; I'] - [ybar(:,1); ybar(:,2)];
%Set increment for derivative approximations
h = 1e-6;
[t ybar1]=ode45(@sirrhs,days,y0,[],[a+h b]);
[t ybar2]=ode45(@sirrhs,days,y0,[],[a b+h]);
F = [ybar1(:,1)-ybar(:,1) ybar2(:,1)-ybar(:,1); ybar1(:,2)-ybar(:,2) ybar2(:,2)-ybar(:,2)]/h;
delp = F\dely
pnew = pbar'+delp
%For 95% confidence interval for q=2(N-1)-2=22
l = 2.0739;
V = inv(F'*F);
ssq = (norm(dely-F*delp)^2)/22;
s = sqrt(ssq)
error = l*sqrt(ssq*diag(V))
%
function yprime = sirrhs(t,y,p)
a = p(1); b = p(2); 
yprime = [-a*y(1)*y(2);a*y(1)*y(2)-b*y(2)];