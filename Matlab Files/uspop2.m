%USPOP2: MATLAB script M-file that uses a 
%central difference derivative approximation
%to approximate parameter values for a logistic
%model to U.S. population growth
%
%Define data
uspop
%
dydt = (pops(3:end)-pops(1:end-2))/20;
plot(pops(2:end-1),dydt./pops(2:end-1),'o')
title({'Plot of per capita growth vs populations' 'central differences'},'FontSize',15)
xlabel('Populations')
ylabel('Per capital growth rate')
pause
p=polyfit(pops(2:end-1),dydt./pops(2:end-1),1);
r=p(2)
K= -r/p(1)
pause
%
%Plot regression line
plot(pops(2:end-1),dydt./pops(2:end-1),'o',pops(2:end-1),p(1)*pops(2:end-1)+p(2))
title({'Plot of per capita growth vs populations', 'central differences, with regression line'},'FontSize',15)
xlabel('Populations')
ylabel('Per capital growth rate')
pause
%
%Plot ODE solution vs data
y0 = pops(1);
logistic = @(t) y0*K./(y0+(K-y0)*exp(-r*t));
modelpops = logistic(decades);
plot(decades, pops, 'o', decades, modelpops)
title({'Plot of data and model', 'parameters found by central differences'},'FontSize',15)
xlabel('Decades, 1790-2010')
ylabel('U. S. Populations')