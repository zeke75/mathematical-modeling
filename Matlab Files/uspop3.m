%USPOP3: MATLAB script M-file that uses MATLAB's built-in
%least squares regression function lsqcurvefit to find 
%least squares values for r, K, and y0, for a logistic
%fit of U.S. population data
%
%define data
uspop
%Define logistic solution
y = @(p,t) p(2)*p(3)./(p(3)+(p(2)-p(3))*exp(-p(1)*t));
%Initial estimate of parameters
%Forward differences
%p0 = [.0318 317.4824 pops(1)];
%Central differences
p0=[.0281 342.1975 pops(1)];
[p error]=lsqcurvefit(y,p0,decades,pops)
N=length(decades); m = length(p);
sd=sqrt(error/(N-m))
pause
%
%Plot model along with data
modelpops = y(p,decades);
plot(decades,pops,'o',decades,modelpops)
title({'Plot of data and model', 'parameters found by nonlinear regression'},'FontSize',15)
xlabel('Decades, 1790-2010')
ylabel('U. S. Populations')