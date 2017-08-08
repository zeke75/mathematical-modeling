% Problem 5a
days=[0 3 4 5 6 7 8 9 10 11 12 13 14];
S=[762 740 650 400 250 120 80 50 20 18 15 13 10];
I=[1 20 80 220 300 260 240 190 120 80 20 5 2];

Y2 = (I(4:13)-I(2:11))./(2*I(3:12));
X2 = S(3:12);
c2 = polyfit(X2,Y2,1);
a = c2(1)
b = -c2(2)
lvrhs = @(t,y) [-a*y(1)*y(2);a*y(1)*y(2)-b*y(2)];
[t,y]=ode45(lvrhs,[0,14],[762; 1]);
subplot(2,1,1)
plot(t,y(:,1),days,S,'o')
title('Susceptible Individuals, model and data','FontSize',14)
subplot(2,1,2)
plot(t,y(:,2),days,I,'o')
title('Infected Individuals, model and data','FontSize',14)