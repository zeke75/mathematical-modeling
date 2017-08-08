function yprime = ode_rhs4(x,y)
%ODE_RHS4: MATLAB function M-file that stores the 
%right-hand side of the ODE y' = x*y^2+y
yprime = x*y^2+y;