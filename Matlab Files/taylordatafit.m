%TAYLORDATAFIT: MATLAB script M-file that analyzes the data stored
%in taylordata.m
%
%define and fit the data
taylordata;
%
%VERIFICATION OF THE 2/5 POWER LAW
plot(log(t),log(R),'o')
title('Data Plot: ln R Against ln t','FontSize',15)
xlabel('ln t')
ylabel('ln R')
pause
p=polyfit(log(t),log(R),1);
plot(log(t),log(R),'o',log(t),p(1)*log(t)+p(2))
title('Data and Fit: ln R Against ln t','FontSize',15)
xlabel('ln t')
ylabel('ln R')
legend('Data','Fit','location','Northwest')
fprintf('Slope = %5.4f; Should be .4000.\n',p(1));
pause
%
%METHOD 1 FOR COMPUTING C: DIRECT FIT
c = t'.^(2/5)\R' %i.e., F = t'.^(2/5), this is the nonlinear fit
%
%Compute E
E = (c*rho^(1/5)/phi0)^5 %in Joules (kg m^2/s^2)
pause
%One metric ton (1,000 kg or 2,204.62 lbs) of TNT corresponds to 
%an energy of 4.25e9 Joules, and so:
Etons = E/4.25e9;
fprintf('This corresponds with %7.2f metric tons of TNT\n',Etons);
pause
%
%METHOD 2 FOR COMPUTING C: TAYLOR'S APPROACH
%NOTE: Taylor used cm, and log10
Y = log(R)-(2/5)*log(t);
F = ones(size(R))';
ctemp = F\Y'
taylorc = exp(ctemp)
Etaylor = (taylorc*rho^(1/5)/phi0)^5 %in Joules (kg m^2/s^2)
pause
Etaylortons = Etaylor/4.25e9;
fprintf('This corresponds with %7.2f metric tons of TNT\n',Etaylortons);
pause
fprintf('Taylor reported 16,800 metric tons. In most references the energy is\n')
fprintf('now reported as 20,000 metric tons.\n')