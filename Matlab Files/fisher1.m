function fisher1
%FISHER1: MATLAB function M-file that solves a 
%Fisher-type PDE.
%
m=0;            %Recall that m is part of the PDE specification in MATLAB
tvals=0:.02:5;  %Time discretization
xvals=0:.01:1;  %Space discretization
%Now evolve with in time
u = pdepe(m,@eqn,@initial,@bc,xvals,tvals);
fig=plot(xvals,u(1,:),'erase','xor');
axis([0 1 min(reshape(u(:,:),[],1)) max(reshape(u(:,:),[],1))]);
%These reshape commands simply turn the matrices into vectors
%to facilitate calculation of the minimum and maximum values of 
%u over all space and time
title(['Time = ',num2str(0),'years'])
pause
for k=2:length(tvals)
    set(fig,'xdata',xvals,'ydata',u(k,:));
    title(['Time = ',num2str(tvals(k)),'years'])
    pause(.2)
end
pause
mesh(xvals,tvals,u)
title('Fisher Population')
xlabel('Position x')
ylabel('Time t')
zlabel('Solution u')
pause
%
surf(xvals,tvals,u)
title('Fisher Population')
xlabel('Position x')
ylabel('Time t')
zlabel('Solution u')
pause
%
%Evaluating u between mesh points
%For t = 1, we have index j = 51
xout=[exp(1)/4, pi/4]
[u,DuDx] = pdeval(m,xvals,u(51,:),xout)
%PDE
function [c,f,s] = eqn(x,t,u,DuDx)
%Define the PDE
mu = .01; r=.0215; K=445.9715;
c=1; f=mu*DuDx; s=r*u.*(1-u/K);
%Initial Condition
function value = initial(x)
value=7.7463*(1+sin(pi*x-pi/2));
%Boundary condition
function [pl,ql,pr,qr]=bc(xl,ul,xr,ur,t)
%Define boundary data
pl=0; ql=1; pr=0; qr=1;