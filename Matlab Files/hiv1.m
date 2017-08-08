%HIV1: MATLAB script M-file that solves a simple 
%HIV model.
%
a = 125.5; b = .1255; c = 1.4476e-3; k = .4537; N = 10; r = 5.9640;
rhs = @(t,y) [a-b*y(1)-c*y(1)*y(3);c*y(1)*y(3)-k*y(2);k*N*y(2)-r*y(3)];
y0 = [1000;0;.001];     %Small initial infection 
options = odeset('AbsTol',1e-10);
[t y] = ode45(rhs,[0 365],y0,options);
subplot(3,1,1)
plot(t,y(:,1))
title('Healthy T cell population','FontSize',15)
xlabel('Time in Days')
ylabel('Healthy T cells per cubic millimeter')
subplot(3,1,2)
plot(t,y(:,2))
title('Infected T cell population','FontSize',15)
xlabel('Time in Days')
ylabel('Infected T cells per cubic millimeter')
subplot(3,1,3)
plot(t,y(:,3))
title('Virus population','FontSize',15)
xlabel('Time in Days')
ylabel('Virions per cubic millimeter')
