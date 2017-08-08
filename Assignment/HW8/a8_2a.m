% Problem 2a
g=9.81; b0=1; %Initial guess
rhs = @(t,y,b) [y(2);-g+b*(y(2)^2)];
bc = @(yleft,yright,b) [yleft(1)-4.06;yright(1);yleft(2)];   
initial_partition = linspace(0,0.95,20);
initial_solution = [4.06;-1];
solinit = bvpinit(initial_partition,initial_solution,b0);
sol = bvp4c(rhs,bc,solinit)
fprintf('b = %5.3f\n',sol.parameters)