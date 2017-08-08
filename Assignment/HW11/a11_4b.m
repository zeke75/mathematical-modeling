function a11_4b

m=0;            
tvals=0:1:25;  %Time discretization
xvals=0:.04:1;  %Space discretization

sol = pdepe(m,@eqn,@initial,@bc,xvals,tvals);

subplot(3,1,1)
surf(xvals,tvals,sol(:,:,1))
title('u(x,t)')
xlabel('Distance x')
ylabel('Time t')
zlabel('u(x,t)')
%
subplot(3,1,2)
surf(xvals,tvals,sol(:,:,2))
title('v(x,t)')
xlabel('Distance x')
ylabel('Time t')
zlabel('v(x,t)')
%
subplot(3,1,3)
surf(xvals,tvals,sol(:,:,3))
title('w(x,t)')
xlabel('Distance x')
ylabel('Time t')
zlabel('w(x,t)')

%Define the PDE
function [c,f,s] = eqn(x,t,u,DuDx)
r1=.02; r2=.03; r3=.05; 
s1=2; s2=2; s3=.5; s4=1; s5=.5; s6=1; 
k1=20; k2=10; k3=10;
B = 1e-5*[1 2 1; 5 3 2; 10 .8 30];
c=[1;1;1]; 
f=B*DuDx;          
s=[r1*u(1)*(1-(u(1)+s1*u(2)+s2*u(3))/k1); r2*u(2)*(1-(s3*u(1)+u(2)+s4*u(3))/k2); r3*u(1)*(1-(s5*u(1)+s6*u(2)+u(3))/k3)];
%Initial Condition
function value = initial(x)
value = [20*(1+cos(pi*x)); 10*(1+sin(2*pi*x-pi/2)); 10*(1+sin(pi*x-pi/2))]; 
%Boundary condition
function [pl,ql,pr,qr]=bc(xl,ul,xr,ur,t)
%Define boundary data
pl=[0;0;0]; 
ql=[1;1;1]; 
pr=[0;0;0]; 
qr=[1;1;1];