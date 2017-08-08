%ODE5: MATLAB script M-file that solves 
%the ODE y' = xy^2 + y, for y(0) = 1 
%on [0,.5]. The output is returned as a 
%MATLAB structure.
rhs = @(x,y) x*y^2+y;
xspan = [0 .5];
y0 = 1;
sol = ode45(rhs,xspan,y0)