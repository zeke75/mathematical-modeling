%Problem 5
decades=0:10:220;
pops=[3.93 5.31 7.24 9.64 12.87 17.07 23.19 31.44 39.82 50.16 62.95 75.99...
        91.97 105.71 122.78 131.67 151.33 179.32 203.21 226.5 249.63 281.42 308.75];

%5a
dydt = diff(pops)./diff(decades);
p=polyfit(log(pops(1:end-1)),dydt./pops(1:end-1),1);
r=-p(1)
K= exp(p(2)/r)
y0=(pops(1))
subplot(2,1,1);
plot(log(pops(1:end-1)),dydt./pops(1:end-1),'o',log(pops(1:end-1)),p(1)*log(pops(1:end-1))+p(2))
title({'Plot of per capita growth vs ln(populations)' 'forward differences'},'FontSize',15)
xlabel('ln(Populations)')
ylabel('Per capital growth rate')

%5b
y = @(p,t) p(2)*((p(3)/p(2)).^(exp(-p(1)*t)));
%Initial estimate of parameters
%Forward differences
p0 = [0.0070 1221.7 pops(1)]
[p error]=lsqcurvefit(y,p0,decades,pops)
sd=sqrt(error/(length(decades)-3))
%Plot model along with data
modelpops = y(p,decades);
subplot(2,1,2);
plot(decades,pops,'o',decades,modelpops)
title({'Plot of data and model', 'parameters found by nonlinear regression'},'FontSize',15)
xlabel('Decades, 1790-2010')
ylabel('U. S. Populations')

%5c
p(1) = .0061; p(2) = 1392.4162; p(3) = 4.3752;
y = @(p,t) p(2)*((p(3)/p(2)).^(exp(-p(1)*t)));
h=1e-4;
y_r=(y(p+[h 0 0],decades)-y(p,decades))/h;
y_K=(y(p+[0 h 0],decades)-y(p,decades))/h;
y_y0=(y(p+[0 0 h],decades)-y(p,decades))/h;
dely = pops-y(p,decades);
F = [y_r' y_K' y_y0'];
delp = F\dely'
%Linear standard deviation
lsd = sqrt(norm(dely' - F*delp)^2/20);
%For 95% confidence interval l=2.3646
l = 2.3646;
V = inv(F'*F);
error = l*sqrt(lsd^2*diag(V))