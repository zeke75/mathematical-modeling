% Problem 2b

g=9.81; b=0.065; % From result of 2a
rhs = @(t,y) [y(2);-g-b*(y(2)^2)];
bc = @(yleft,yright) [yleft(1)-0.39;yright(1)]; 
initial_partition = linspace(0,2.13,25);
initial_solution = [0.39;1];
solinit = bvpinit(initial_partition,initial_solution);
sol = bvp4c(rhs,bc,solinit)
y2=sol.y(2,:);
v0=y2(1)
