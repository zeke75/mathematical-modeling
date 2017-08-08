function ode3
%ODE3: MATLAB function M-file that solves 
%the ODE y' = xy^2 + y, for y(0) = 1 
%on [0,.5] and plots the solution.
%Uses an anonymous subfunction.  Even though 
%there are no inputs or outputs, this must
%be a function file in order to have a subfunction.
rhs = @(x,y) subrhs(x,y)
xspan = [0 .5];
y0 = 1;
[x y] = ode45(rhs,xspan,y0)
plot(x,y)
pause
%In many cases we want to restrict the values
%MATLAB returns. 
xspan = 0:.1:.5; 
[x y] = ode45(rhs,xspan,y0)
%
function yprime = subrhs(x,y)
yprime = x*y^2+y;