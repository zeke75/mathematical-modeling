%LVODE: MATLAB script M-file that solves and plots
%solutions for the Lotka-Volterra predator-prey 
%system with y1(0) = 30, y2(0) = 4, and the following
%parameter values:
a = .5471; b = .0281; c = .0266; r = .8439;
lvrhs = @(t,y) [a*y(1)-b*y(1)*y(2); -r*y(2)+c*y(1)*y(2)];
[t,y] = ode45(lvrhs,[0 20],[30;4])
subplot(2,1,1)
plot(t,y(:,1))
title('Prey Population','FontSize',15)
subplot(2,1,2)
plot(t,y(:,2))
title('Predator Population','FontSize',15)