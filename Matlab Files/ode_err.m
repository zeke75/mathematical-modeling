%ODE_ERR: MATLAB script M-file that solves 
%the ODE y' = xy^2 + y, for y(0) = 1 
%on [0,1-1e-6] and plots the solution.
rhs = @(x,y) x*y^2+y;
xvalues = linspace(0,1-1e-6,5);
y0 = 1;
%First try
[x y] = ode45(rhs,xvalues,y0)
pause
%Second try
options = odeset('RelTol',1e-6)
pause
fprintf('Use RelTol = 1e-6\n')
[x y] = ode45(rhs,xvalues,y0,options)
fprintf('Error = %e\n',abs(1e6-y(end)))
pause
%Third try
fprintf('Use RelTol = 1e-8\n')
options = odeset('RelTol',1e-8);
[x y] = ode45(rhs,xvalues,y0,options)
fprintf('Error = %e\n',abs(1e6-y(end)))
pause
%Fourth try
fprintf('Use RelTol = 1e-10\n')
options = odeset('RelTol',1e-10);
[x y] = ode45(rhs,xvalues,y0,options)
fprintf('Error = %e\n',abs(1e6-y(end)))
pause
%Fifth try
fprintf('Use RelTol = 1e-10 and AbsTol = 1e-8\n')
options = odeset('RelTol',1e-10,'AbsTol',1e-8);
[x y] = ode45(rhs,xvalues,y0,options)
fprintf('Error = %e\n',abs(1e6-y(end)))
pause
%Sixth try
fprintf('Use RelTol = 1e-10 and AbsTol = 1e-10\n')
options = odeset('RelTol',1e-10,'AbsTol',1e-10);
[x y] = ode45(rhs,xvalues,y0,options)
fprintf('Error = %e\n',abs(1e6-y(end)))
pause
%Seventh try
fprintf('Use RelTol = 1e-10 and AbsTol = 1e-12\n')
options = odeset('RelTol',1e-10,'AbsTol',1e-12);
[x y] = ode45(rhs,xvalues,y0,options)
fprintf('Error = %e\n',abs(1e6-y(end)))
pause
%Eighth try
fprintf('Use RelTol = 1e-12 and AbsTol = 1e-12\n')
options = odeset('RelTol',1e-12,'AbsTol',1e-12);
[x y] = ode45(rhs,xvalues,y0,options)
fprintf('Error = %e\n',abs(1e6-y(end)))
pause
%Ninth try
fprintf('Use RelTol = 1e-14 and AbsTol = 1e-12\n')
options = odeset('RelTol',1e-14,'AbsTol',1e-12);
[x y] = ode45(rhs,xvalues,y0,options)
fprintf('Error = %e\n',abs(1e6-y(end)))
pause
%Tenth try
fprintf('Use RelTol = 1e-14 and AbsTol = 1e-14\n')
options = odeset('RelTol',1e-14,'AbsTol',1e-14);
[x y] = ode45(rhs,xvalues,y0,options)
fprintf('Error = %e\n',abs(1e6-y(end)))
pause
%Eleventh try
fprintf('Use (roughly) RelTol = 1e-14 and AbsTol = 1e-16\n')
options = odeset('RelTol',1e-14,'AbsTol',1e-16);
[x y] = ode45(rhs,xvalues,y0,options)
fprintf('Error = %e\n',abs(1e6-y(end)))