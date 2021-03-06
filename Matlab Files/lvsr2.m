function lvsr2
%LVSR2: MATLAB function M-file for analyzing standardized
%residuals for the Lotka-Volterra model fit to the Hudson 
%Bay data.
%Scaling is used.
lvdata;
w1 = std(H);
w2 = std(L);
y0 = [30.0;4.0];
%Use parameters obtained by scaling
a = .5571; b = .0282; c = .0264; r = .8296;
pbar = [a b c r];
[t ybar]=ode45(@lvrhs,years,y0,[],pbar);
dely = [H'/w1; L'/w2] - [ybar(:,1)/w1; ybar(:,2)/w2];
%Set increment for derivative approximations
h = 1e-6;
[t ybar1]=ode45(@lvrhs,years,y0,[],[a+h b c r]);
[t ybar2]=ode45(@lvrhs,years,y0,[],[a b+h c r]);
[t ybar3]=ode45(@lvrhs,years,y0,[],[a b c+h r]);
[t ybar4]=ode45(@lvrhs,years,y0,[],[a b c r+h]);
F1 = [ybar1(:,1)-ybar(:,1) ybar2(:,1)-ybar(:,1) ybar3(:,1)-ybar(:,1) ybar4(:,1)-ybar(:,1)]/h;
F2 = [ybar1(:,2)-ybar(:,2) ybar2(:,2)-ybar(:,2) ybar3(:,2)-ybar(:,2) ybar4(:,2)-ybar(:,2)]/h;
F = [F1/w1;F2/w2];
delp = F\dely
pnew = pbar'+delp
q = 2*(length(H)-1)-length(pbar);
M=F*((F'*F)\F');
s = sqrt(norm(dely-F*delp)^2/q);
r = (dely-F*delp)./(s*sqrt(1-diag(M)));
%Fix initial data zeros
r = [r(2:length(H));r(length(H)+2:end)];
l = stut(q,.68);
%Scaled Predictions
pr = [ybar(:,1)/w1;ybar(:,2)/w2] + F*delp;   %All first components first, then all second; SCALED
pr = [pr(2:length(H));pr(length(H)+2:end)];
plot(pr,r,'o',pr,-l*ones([1 length(pr)]),'r',pr,l*ones([1 length(pr)]),'r');
title('Standardized residuals vs. Predictions','FontSize',15)
xlabel('Predictions')
ylabel('Standardized residuals r_k')
dex=0;
for j=1:length(r)
    if abs(r(j)) <= l
        dex=dex+1;
    end
end
dex
ratio = dex/length(r)
%
function yprime = lvrhs(t,y,p)
a = p(1); b = p(2); c = p(3); r = p(4);
yprime = [a*y(1)-b*y(1)*y(2); -r*y(2)+c*y(1)*y(2)];