%PENDBVP3: MATLAB script M-file that uses bvp4c 
%to find the length l of a pendulum with 
%initial-boundary conditions theta(0)=pi/4, theta'(0)=0, theta(1)=0.
%
%In this case we look for the second time theta(1)=0.
g=9.81; l0=1; %In this case l0 is just an initial guess
rhs = @(t,y,l) [y(2);-(g/l)*sin(y(1))]; %Notice the l is added as a variable
bc = @(yleft,yright,l) [yleft(1)-pi/4;yright(1);yleft(2)];   
%l is added even though it does not explicitly appear, but parameters in the
%boundary conditions are valid as well.  Note that we now have three 
%boundary conditions.
initial_partition = linspace(0,1,25);
initial_solution = @(t,y) [(pi/4)*cos(3*pi*t/2); -(3*pi^2/8)*sin(3*pi*t/2)];
solinit = bvpinit(initial_partition,initial_solution,l0);
sol = bvp4c(rhs,bc,solinit)
fprintf('l = %5.4f\n',sol.parameters)
plot(sol.x,sol.y(1,:))
title('Pendulum angle as a function of time','FontSize',15)
