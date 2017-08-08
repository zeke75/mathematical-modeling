function ch1
%CH1: MATLAB function M-file that solves the 
%Cahn-Hilliard equation on [0,1]. 
%
m=0;            %Recall that m is part of the PDE specification in MATLAB
tvals=0:.001:.3;  %Time discretization
xvals=0:.005:1;  %Space discretization
kap = .001;
%Now evolve with in time
%options=odeset('MaxStep',1e-6);
u = pdepe(m,@eqn,@initial,@bc,xvals,tvals);
subplot(2,1,1)
fig1=plot(xvals,u(1,:,1),'erase','xor');
axis([0 1 -.2 1.2])
title(['Concentration, Time = ',num2str(0),'seconds'])
subplot(2,1,2)
fig2=plot(xvals,u(1,:,2),'erase','xor');
title('v=u_{xx}')
axis([0 1 min(reshape(u(:,:,2),[],1)) max(reshape(u(:,:,2),[],1))]);
%Energy
[utemp ux]=pdeval(m,xvals,u(1,:,1),xvals);
E(1) = trapz(xvals,u(1,:,1).^2.*(1-u(1,:,1)).^2+kap*ux.^2);
der(1) = ux(1);
pause
for k=2:length(tvals)
    subplot(2,1,1)
    set(fig1,'xdata',xvals,'ydata',u(k,:,1));
    title(['Concentration, Time = ',num2str(tvals(k)),'seconds'])
    subplot(2,1,2)
    set(fig2,'xdata',xvals,'ydata',u(k,:,2));
    title('v=u_{xx}')
    pause(.1)
    [utemp ux]=pdeval(m,xvals,u(k,:,1),xvals);
    E(k) = trapz(xvals,u(k,:,1).^2.*(1-u(k,:,1)).^2+kap*ux.^2);
    der(k) = ux(1);
end
%Computing the energy
pause
figure
semilogy(tvals,E)
%PDE
function [c,f,s] = eqn(x,t,u,DuDx)
%Define the PDE
kap = .001; ddF = 2-12*u(1)+12*u(1)^2;
dddF = -12+24*u(1);
c=[1;0]; 
f=[-kap*DuDx(2);DuDx(1)];           
s=[dddF*DuDx(1)^2+ddF*u(2);-u(2)];
%Initial Condition
function value = initial(x)
%Small fluctuations near .5
u0 = .5+.1*cos(pi*x)+.03*cos(3*pi*x)-.005*cos(5*pi*x);
u0xx = -.1*pi^2*cos(pi*x)-.03*(3*pi)^2*cos(3*pi*x)+.005*(5*pi)^2*cos(5*pi*x);
value = [u0;u0xx];
%Boundary condition
function [pl,ql,pr,qr]=bc(xl,ul,xr,ur,t)
%Define boundary data
pl=[0;0]; 
ql=[1;1]; 
pr=[0;0]; 
qr=[1;1];