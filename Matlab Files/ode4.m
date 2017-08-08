%ODE4: MATLAB script M-file that solves 
%the ODE y' = xy^2 + y, for y(0) = 1 
%on [0,.5] and plots the solution.
%Uses an outside function M-file.
xspan = [0 .5];
y0 = 1;
[x y] = ode45(@ode_rhs4,xspan,y0)
plot(x,y)
pause
%In many cases we want to restrict the values
%MATLAB returns. 
xspan = 0:.1:.5; 
[x y] = ode45(@ode_rhs4,xspan,y0)