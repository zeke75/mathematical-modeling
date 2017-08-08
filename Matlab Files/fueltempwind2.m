function fueltempwind2(x)
%FUELTEMPWIND2: MATLAB function M-file that finds confidence 
%intervals for the mean \mu of the fuel prediction, given an 
%input vector x, for the fuel-temperature-wind example from 
%Kalbfleisch.
%
%The input is the vector x = (x(1) x(2)) containing respectively
%temperature and wind speed
%
fuel = [14.96 14.1 23.76 13.2 18.6 16.79 21.83 16.25 20.98 16.88];
temp = [-3 -1.8 -10 .7 -5.1 -6.3 -15.5 -4.2 -8.8 -2.3];
wind = [15.3 16.4 41.2 9.7 19.3 11.4 5.9 24.3 14.7 16.1];
%
F=[ones(size(fuel))' temp' wind'];
p=F\fuel';
%
%prediction
mu_x = [1 x(1) x(2)]*p
%For 95% confidence interval
q = length(fuel) - length(p);
l = stut(q,.95);
fx = [1 x(1) x(2)];
FL = (F'*F)\F';
a = FL'*fx';
c = norm(a)^2;
ssq = (norm(fuel'-F*p)^2)/7;
error = l*sqrt(ssq*c)
