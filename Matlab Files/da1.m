%DA1: MATLAB script M-file that carries out a dimensional 
%analysis calculation for the example in which an object is 
%fired up from a height h with velocity v
%
%Data 
g = 9.81; v = 8.61;
h = 0:.2:2;
t = [1.76 1.78 1.80 1.82 1.84 1.86 1.89 1.91 1.92 1.94 1.96];
%
pi1 = g*h/v^2;
pi2 = g*t/v;
%
plot(pi1, pi2, 'o')
title('Dimensionless Products for the Data','FontSize',15)
xlabel('\pi_1','FontSize',15)
ylabel('\pi_2','FontSize',15)
set(get(gca,'YLabel'),'Rotation',0.0)
pause
p = polyfit(pi1,pi2,1)
plot(pi1,pi2,'o',pi1,p(1)*pi1+p(2))
title('Dimensionless Products, Data and Fit','FontSize',15)
xlabel('\pi_1','FontSize',15)
ylabel('\pi_2','FontSize',15)
set(get(gca,'YLabel'),'Rotation',0.0)
pause
%
%Compare model with exact solution
modelt = p(1)*h/v+p(2)*v/g;
exactt = (v/g)+sqrt(v^2+2*g*h)/g;
plot(h,modelt,'o',h,exactt,'*')
legend('Model Times','Calculated Times','location','Northwest')
title('Model Time Predictions with Calculated Values ','FontSize',15)
xlabel('Height h','FontSize',15)
ylabel('Time t','FontSize',15)
pause
%
h=0:.2:5;
modelt = p(1)*h/v+p(2)*v/g;
exactt = (v/g)+sqrt(v^2+2*g*h)/g;
plot(h,modelt,'o',h,exactt,'*')
legend('Model Times','Calculated Times','location','Northwest')
title('Model Time Predictions with Calculated Values ','FontSize',15)
xlabel('Height h','FontSize',15)
ylabel('Time t','FontSize',15)
pause
h=0:1:50;
modelt = p(1)*h/v+p(2)*v/g;
exactt = (v/g)+sqrt(v^2+2*g*h)/g;
plot(h,modelt,'o',h,exactt,'*')
legend('Model Times','Calculated Times','location','Northwest')
title('Model Time Predictions with Calculated Values ','FontSize',15)
xlabel('Height h','FontSize',15)
ylabel('Time t','FontSize',15)