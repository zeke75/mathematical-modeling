function lvnonlinearfit2
%LVNONLINEARFIT2: MATLAB function M-file that takes an initial 
%approximation of parameter values and carries out nonlinear
%regression to obtain best-fit parameter values for the Lotka-Volterra
%system and the Hudson Bay data.
%
%Data is scaled.
global years L H w1 w2;
lvdata
w1 = std(H);
w2 = std(L);
guess = [.4732; .0240; .0234; .7646];
[p,error]=fminsearch(@lverr, guess);
a = p(1)
b = p(2)
c = p(3)
r = p(4)
s = sqrt(error/(2*(length(H)-1)-length(p))) 
s1 = s*w1
s2 = s*w2
%We use length(H)-1 because the initial value is 
%not a data point for purposes of this fit
pause
%
[t,y]=ode45(@lvrhs,[0,20],[H(1); L(1)],[],p);
subplot(2,1,1)
plot(t,y(:,1),years,H,'o')
title('Prey population, model and data','FontSize',14)
subplot(2,1,2)
plot(t,y(:,2),years,L,'o')
title('Predator population, model and data','FontSize',14)
%
function error = lverr(p)
%LVERR: Function defining error function for 
%example with Lotka-Volterra equations.
global years L H w1 w2;
[t,y] = ode45(@lvrhs,years,[H(1);L(1)],[],p);    %Notice that we pass
                                                 %a parameter vector
error = norm(y(:,1)-H')^2/w1^2+norm(y(:,2)-L')^2/w2^2;
%
function value = lvrhs(t,y,p)
%LVRHS: ODE for example Lotka-Volterra paramter
%estimation example. p(1)=a, p(2) = b, p(3) = c, p(4) = r.
value=[p(1)*y(1)-p(2)*y(1)*y(2);-p(4)*y(2)+p(3)*y(1)*y(2)];