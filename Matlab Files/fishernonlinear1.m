function fishernonlinear1
%FISHERNONLINEAR1: MATLAB function M-file that 
%estimates parameter values for a PDE version of 
%the logistic population model based on 
%numerically generated data
%
guess = [.0226;146.1159;.0100];
[p,E]=fminsearch(@error, guess)
%
function err = error(p)
load fisherdata;
m=0;                %Recall that m is part of the PDE specification in MATLAB
tvals=0:.2:10;       %These correspond with data; MATLAB uses an internal 
                    %discretization
xvals=0:.01:1;      %MATLAB uses this mesh, so we must evaluate u at data point
                    %after the calculation
%Now evolve with in time
u = pdepe(m,@eqn,@initial,@bc,xvals,tvals,[],p);
err = norm(reshape(u(:,1:10:101)-udata,[],1))^2;
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