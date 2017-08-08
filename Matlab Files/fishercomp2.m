function fishercomp2
%FISHERCOMP2: MATLAB function M-file that solves a 
%PDE version of the Fisher-type population model
%and compares the results with data.
m=0; %Recall that m is part of the PDE specification in MATLAB
tvals=0:.2:10;
xvals=0:.01:1;
%Now evolve with in time
load fisherdata;
u = pdepe(m,@eqn,@initial,@bc,xvals,tvals);
fig1=plot(xvals,u(1,:),'erase','xor');
title(['Population density u as a function of x, Time = ', num2str(0), 'years'],'fontsize',14);
hold on
fig2=plot(xvals(1:10:101),udata(1,:),'ro','erase','xor');
legend('Approximate Solution','Data','location','NorthWest')
axis([0 1 min(reshape(u,[],1)) max(reshape(u,[],1))]);
pause
for k=2:length(tvals)
    set(fig1,'xdata',xvals,'ydata',u(k,:));
    set(fig2,'xdata',xvals(1:10:101),'ydata',udata(k,:));
    title(['Population density u as a function of x, Time = ',num2str(tvals(k)),'years'],'fontsize',14)
    pause(.2)
end
%
%Files for solving the PDE
%
function [c,b,s] = eqn(x,t,u,DuDx)
%Define the PDE
%mu=.0100; r = .0215; K = 418.4789;
mu=.0100; r = .0226; K=146.1159;
c=1; b=mu*DuDx; s=r*u*(1-u/K);
%
function [pl,ql,pr,qr]=bc(xl,ul,xr,ur,t)
%Define boundary data
pl=0; ql=1; pr=0; qr=1;
%
function value = initial(x)
value = 7.7463*(1+sin(pi*x-pi/2));
