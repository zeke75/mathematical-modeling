% Problem 1a
rhs = @(x,y) (x^2)*(y^2);
xspan = 0:.2:1; 
y0 = 1;
[x y] = ode45(rhs,xspan,y0)
plot(x,y)
%adjust RelTol & AbsTol
xvalues = linspace(0,(3*(1-1e-6))^(1/3),5);
y0 = 1;
%First try
[x y] = ode45(rhs,xvalues,y0);
%Second try
fprintf('Use RelTol = 1e-6\n')
options = odeset('RelTol',1e-6);
[x y] = ode45(rhs,xvalues,y0,options);
fprintf('Error = %e\n',abs(1e6-y(end)))
%Third try
fprintf('Use RelTol = 1e-8\n')
options = odeset('RelTol',1e-8);
[x y] = ode45(rhs,xvalues,y0,options);
fprintf('Error = %e\n',abs(1e6-y(end)))
%Fourth try
fprintf('Use RelTol = 1e-8 and AbsTol = 1e-8\n')
options = odeset('RelTol',1e-8,'AbsTol',1e-8);
[x y] = ode45(rhs,xvalues,y0,options);
fprintf('Error = %e\n',abs(1e6-y(end)))
%Fifth try
fprintf('Use RelTol = 1e-8 and AbsTol = 1e-10\n')
options = odeset('RelTol',1e-8,'AbsTol',1e-10);
[x y] = ode45(rhs,xvalues,y0,options);
fprintf('Error = %e\n',abs(1e6-y(end)))
%Sixth try
fprintf('Use RelTol = 1e-10 and AbsTol = 1e-10\n')
options = odeset('RelTol',1e-10,'AbsTol',1e-10);
[x y] = ode45(rhs,xvalues,y0,options);
fprintf('Error = %e\n',abs(1e6-y(end)))
%Seventh try
fprintf('Use RelTol = 1e-12 and AbsTol = 1e-10\n')
options = odeset('RelTol',1e-12,'AbsTol',1e-10);
[x y] = ode45(rhs,xvalues,y0,options);
fprintf('Error = %e\n',abs(1e6-y(end)))
%Eighth try
fprintf('Use RelTol = 1e-12 and AbsTol = 1e-12\n')
options = odeset('RelTol',1e-12,'AbsTol',1e-12);
[x y] = ode45(rhs,xvalues,y0,options);
fprintf('Error = %e\n',abs(1e6-y(end)))
%Ninth try
fprintf('Use RelTol = 1e-12 and AbsTol = 1e-14\n')
options = odeset('RelTol',1e-12,'AbsTol',1e-14);
[x y] = ode45(rhs,xvalues,y0,options);
fprintf('Error = %e\n',abs(1e6-y(end)))
%Tenth try
fprintf('Use RelTol = 1e-14 and AbsTol = 1e-14\n')
options = odeset('RelTol',1e-14,'AbsTol',1e-14);
[x y] = ode45(rhs,xvalues,y0,options);
fprintf('Error = %e\n',abs(1e6-y(end)))
%Eleventh try
fprintf('Use (roughly) RelTol = 1e-16 and AbsTol = 1e-14\n')
options = odeset('RelTol',1e-16,'AbsTol',1e-14);
[x y] = ode45(rhs,xvalues,y0,options)
fprintf('Error = %e\n',abs(1e6-y(end)))

