%Problem 4
decades=0:10:220;
pops=[3.93 5.31 7.24 9.64 12.87 17.07 23.19 31.44 39.82 50.16 62.95 75.99...
        91.97 105.71 122.78 131.67 151.33 179.32 203.21 226.5 249.63 281.42 308.75];

%4a    
p=polyfit(decades,log(pops),1);
r=p(1)
y0=exp(p(2))
subplot(2,1,1);
plot(decades,log(pops),'o',decades,decades*p(1)+p(2))    
title({'Plot of ln(Populations) vs Decades'},'FontSize',15)
ylabel('ln(Populations)')
xlabel('Decades')  
error=(norm(pops-y0*exp(r*decades)))^2


%4b
y=@(p,t)p(2)*exp(p(1)*t);
%result of 4a
p0=[0.0196 6.3184];
[p error]=lsqcurvefit(y,p0,decades,pops)
modelpops = y(p,decades);
subplot(2,1,2);
plot(decades,pops,'o',decades,modelpops)
title({'Plot of data and model', 'parameters found by nonlinear regression'},'FontSize',15)
xlabel('Decades, 1790-2010')
ylabel('U. S. Populations')