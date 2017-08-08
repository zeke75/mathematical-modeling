function lvpde1
%LVPDE1: MATLAB function M-file that solves a 
%Lotka-Volterra predator-prey PDE.
%
m=0;            %Recall that m is part of the PDE specification in MATLAB
tvals=0:.01:8;  %Time discretization
xvals=0:.005:1;  %Space discretization
%Now evolve with in time
options=odeset('RelTol',1e-6,'AbsTol',1e-8);
%The options statement is relevant for the ODE solvers 
%the PDE solvers works with. Here, it's used because errors 
%begin to grow near the boundary.
u = pdepe(m,@eqn,@initial,@bc,xvals,tvals,options);
subplot(2,1,1)
fig1=plot(xvals,u(1,:,1),'erase','xor');
title(['Prey, Time = ',num2str(0),'years'])
axis([0 1 min(reshape(u(:,:,1),[],1)) max(reshape(u(:,:,1),[],1))])
subplot(2,1,2)
fig2=plot(xvals,u(1,:,2),'erase','xor');
title('Predators')
axis([0 1 min(reshape(u(:,:,2),[],1)) max(reshape(u(:,:,2),[],1))])
pause
for k=2:length(tvals)
    subplot(2,1,1)
    set(fig1,'xdata',xvals,'ydata',u(k,:,1));
    title(['Prey, Time = ',num2str(tvals(k)),'years'])
    subplot(2,1,2)
    set(fig2,'xdata',xvals,'ydata',u(k,:,2));
    title('Predators')
    pause(.05)
end
pause
mesh(xvals,tvals,u(:,:,1))
title('Prey Population')
xlabel('Position x')
ylabel('Time t')
zlabel('Prey Density')
pause
%
mesh(xvals,tvals,u(:,:,2))
title('Predator Population')
xlabel('Position x')
ylabel('Time t')
zlabel('Predator Density')
%PDE
function [c,f,s] = eqn(x,t,u,DuDx)
%Define the PDE
a=.5482; b = .0283; cc = .0265; r = .8369;  %Note that we switch to cc 
                                            %to be consistent in our use of
                                            %c as the coefficient of u_t
K = 1e-4*[1 2; -.2 .3];
c=[1;1]; 
f=K*DuDx;         %Note the matrix multiplication  
s=[a*u(1)-b*u(1)*u(2);-r*u(2)+cc*u(1)*u(2)];
%Initial Condition
function value = initial(x)
value = [30*(1+sin(2*pi*x-pi/2));4*(1+cos(2*pi*x))];
%Boundary condition
function [pl,ql,pr,qr]=bc(xl,ul,xr,ur,t)
%Define boundary data
pl=[0;0]; 
ql=[1;1]; 
pr=[0;0]; 
qr=[1;1];