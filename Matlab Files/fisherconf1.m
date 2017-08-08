function fisherconf1
%FISHERCONF1: MATLAB function M-file that computes
%95% confidence intervals for parameters for a 
%Fisher-type equation.
load fisherdata;
pbar = [.0215 418.4789 .0100];
%
m=0;                %Recall that m is part of the PDE specification in MATLAB
tvals=0:.2:10;      %These correspond with data; MATLAB uses an internal 
                    %discretization
xvals=0:.01:1;      %MATLAB uses this mesh, so we must evaluate u at data point
                    %after the calculation
ubar = pdepe(m,@eqn,@initial,@bc,xvals,tvals,[],pbar);
delu = reshape(udata-ubar(:,1:10:101),[],1);
%
%Set increment for derivative approximations
h = 1e-6;
ubar1 = pdepe(m,@eqn,@initial,@bc,xvals,tvals,[],pbar+[h 0 0]);
ubar2 = pdepe(m,@eqn,@initial,@bc,xvals,tvals,[],pbar+[0 h 0]);
ubar3 = pdepe(m,@eqn,@initial,@bc,xvals,tvals,[],pbar+[0 0 h]);
F = [reshape(ubar1(:,1:10:101)-ubar(:,1:10:101),[],1), ...
    reshape(ubar2(:,1:10:101)-ubar(:,1:10:101),[],1), ...
    reshape(ubar3(:,1:10:101)-ubar(:,1:10:101),[],1)]/h;
delp = F\delu
pnew = pbar'+delp
%For 95% confidence interval, q=50 x 11 - 3 = 547, 
%so approximate the Student's t distribution by a Gaussian
l = 2;      %Corresponds with a 95.45% confidence interval,
            %which is standard for Gaussian, since it is
            %two standard deviations
V = inv(F'*F);
ssq = (norm(delu-F*delp)^2)/547;
s = sqrt(ssq)
error = l*sqrt(ssq*diag(V))
%
function [c,b,s] = eqn(x,t,u,DuDx,p)
%Define the PDE
mu = p(3); r=p(1); K=p(2);
c=1; b=mu*DuDx; s=r*u*(1-u/K);
%
function [pl,ql,pr,qr]=bc(xl,ul,xr,ur,t,p)
%Define boundary data
pl=0; ql=1; pr=0; qr=1;
%
function value = initial(x,p)
value = 7.7463*(1+sin(pi*x-pi/2));