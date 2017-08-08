function yprime = ode_rhs1(x,y)
%ODE_RHS: MATLAB function M-file that stores the 
%right-hand side of the ODE y' = x*y^2+y
yprime = x*y^2+y;