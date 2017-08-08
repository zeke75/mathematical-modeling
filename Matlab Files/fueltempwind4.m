%FUELTEMPWIND4: MATLAB script M-file that analyzes 
%the the fuel-temperature-wind example from Kalbfleisch 
%to verify the residuals are student's t distributed
%
fuel = [14.96 14.1 23.76 13.2 18.6 16.79 21.83 16.25 20.98 16.88]
temp = [-3 -1.8 -10 .7 -5.1 -6.3 -15.5 -4.2 -8.8 -2.3]
wind = [15.3 16.4 41.2 9.7 19.3 11.4 5.9 24.3 14.7 16.1]
%
F=[ones(size(fuel))' temp' wind'];
M=F*((F'*F)\F');
p=F\fuel';
s = sqrt(norm(fuel'-F*p)^2/7);
r = (fuel'-F*p)./(s*sqrt(1-diag(M)))
q = length(fuel)-length(p);     %degrees of freedom
l = stut(q,.68)
plot(F*p,r,'o',F*p,-l*ones([1 length(F*p)]),'r',F*p,l*ones([1 length(F*p)]),'r');
title('Standardized residuals vs. \mu_k','FontSize',15)
xlabel('\mu_k = (Fp)_k')
ylabel('Standardized residuals r_k')
