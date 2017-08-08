%FUELTEMPWIND1: MATLAB script M-file that computes parameter 
%values for a multilinear fit to the fuel-temperature-wind 
%example from Kalbfleisch
%
fuel = [14.96 14.1 23.76 13.2 18.6 16.79 21.83 16.25 20.98 16.88]
temp = [-3 -1.8 -10 .7 -5.1 -6.3 -15.5 -4.2 -8.8 -2.3]
wind = [15.3 16.4 41.2 9.7 19.3 11.4 5.9 24.3 14.7 16.1]
%
F=[ones(size(fuel))' temp' wind']
pmat=F\fuel'
p = (F'*F)\(F'*fuel')
error = norm(fuel'-F*p)^2