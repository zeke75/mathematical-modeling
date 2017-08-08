%PENDBVP1: MATLAB script M-file that solves a 
%boundary value problem for a simple pendulum.
g=9.81; l=1;
rhs = @(t,y) [y(2);-(g/l)*sin(y(1))];
bc = @(yleft,yright) [yleft(1)-pi/4;yright(1)];
initial_partition = linspace(0,.2,25);
initial_solution = [pi/4;-1];
solinit = bvpinit(initial_partition,initial_solution);
sol = bvp4c(rhs,bc,solinit)
pause
[sol.x' sol.y(1,:)' sol.y(2,:)'] %Note the use of sol.x, even though 
                                 %our independent variable is t
pause
plot(sol.x, sol.y(1,:))
title('Pendulum angle as a function of time t','FontSize',15)
