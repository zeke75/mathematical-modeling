% Problem 1b

mu = 1000;
vdprhs = @(t,y) [y(2); mu*(1-y(1)^2)*y(2)-y(1)];
[t,y] = ode23tb(vdprhs,[0 5000],[2;0]);
plot(t,y(:,1))