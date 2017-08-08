%LVLINEARFIT: MATLAB script M-file to carry out linear parameter
%estimation for the Lotka-Volterra model with the Hudson Bay data
%
lvdata;
Y1 = (H(3:21)-H(1:19))./(2*H(2:20));    %Central difference derivative approximation
X1 = L(2:20);
plot(X1,Y1,'o')
title(['\fontsize{16} \fontname{Times} (y_1(t+h)-y_1(t-h))/(2hy_1(t)) vs y_2(t)'])
xlabel(['\fontsize{16} \fontname{Times} y_2(t)'])
ylabel(['\fontsize{16} \fontname{Times} (y_1(t+h)-y_1(t-h))/(2hy_1(t))'])
pause
c1 = polyfit(X1,Y1,1);
plot(X1,Y1,'o',X1,c1(1)*X1+c1(2))
title(['\fontsize{16} \fontname{Times} (y_1(t+h)-y_1(t-h))/(2hy_1(t)) vs y_2(t)'])
xlabel(['\fontsize{16} \fontname{Times} y_2(t)'])
ylabel(['\fontsize{16} \fontname{Times} (y_1(t+h)-y_1(t-h))/(2hy_1(t))'])
pause
Y2 = (L(3:21)-L(1:19))./(2*L(2:20));
X2 = H(2:20);
plot(X2,Y2,'o')
title(['\fontsize{16} \fontname{Times} (y_2(t+h)-y_2(t-h))/(2hy_2(t)) vs y_1(t)'])
xlabel(['\fontsize{16} \fontname{Times} y_1(t)'])
ylabel(['\fontsize{16} \fontname{Times} (y_2(t+h)-y_2(t-h))/(2hy_2(t))'])
pause
c2 = polyfit(X2,Y2,1);
plot(X2,Y2,'o',X2,c2(1)*X2+c2(2))
title(['\fontsize{16} \fontname{Times} (y_2(t+h)-y_2(t-h))/(2hy_2(t)) vs y_1(t)'])
xlabel(['\fontsize{16} \fontname{Times} y_1(t)'])
ylabel(['\fontsize{16} \fontname{Times} (y_2(t+h)-y_2(t-h))/(2hy_2(t))'])
pause
b = -c1(1)
a = c1(2)
c = c2(1)
r = -c2(2)
pause
lvrhs = @(t,y) [a*y(1)-b*y(1)*y(2);-r*y(2)+c*y(1)*y(2)];
[t,y]=ode45(lvrhs,[0,20],[30.0; 4.0]);
subplot(2,1,1)
plot(t,y(:,1),years,H,'o')
title('Prey population, model and data','FontSize',14)
subplot(2,1,2)
plot(t,y(:,2),years,L,'o')
title('Predator population, model and data','FontSize',14)