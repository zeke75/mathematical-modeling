function lvmu2(ti)
%LVMU2: MATLAB function M-file that computes means mu
%and associated 95% confidence intervals for the Lotka-Volterra
%model fit to the Hudson Bay data. We use ti for input t, 
%because t is already in use.
%Scaling is used.
lvdata;
w1 = std(H);
w2 = std(L);
y0 = [30.0;4.0];
%Use parameters obtained by scaling,
%NOT updated for confidence intervals
%Confidence intervals must correspond with updated
%values, but the original nonlinear minimizers are 
%still, in principle, the best parameter values to use.
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
delp = F\dely;
%Now evaluations at ti
[t yt]=ode45(@lvrhs,[0 ti],y0,[],pbar);
[t yt1]=ode45(@lvrhs,[0 ti],y0,[],[a+h b c r]);
[t yt2]=ode45(@lvrhs,[0 ti],y0,[],[a b+h c r]);
[t yt3]=ode45(@lvrhs,[0 ti],y0,[],[a b c+h r]);
[t yt4]=ode45(@lvrhs,[0 ti],y0,[],[a b c r+h]);
delmu1 = [yt1(end,1)-yt(end,1) yt2(end,1)-yt(end,1) yt3(end,1)-yt(end,1) yt4(end,1)-yt(end,1)]*delp/h;
delmu2 = [yt1(end,2)-yt(end,2) yt2(end,2)-yt(end,2) yt3(end,2)-yt(end,2) yt4(end,2)-yt(end,2)]*delp/h;
%
mu1t = delmu1+yt(end,1)
mu2t = delmu2+yt(end,2)
%For 95% confidence interval
q = 2*(length(H)-1)-length(pbar);
l = stut(q,.95);
ft1 = [yt1(end,1)-yt(end,1) yt2(end,1)-yt(end,1) yt3(end,1)-yt(end,1) yt4(end,1)-yt(end,1)]/(h*w1);
ft2 = [yt1(end,2)-yt(end,2) yt2(end,2)-yt(end,2) yt3(end,2)-yt(end,2) yt4(end,2)-yt(end,2)]/(h*w2);
%
FL = (F'*F)\F';
a1 = FL'*ft1';
a2 = FL'*ft2';
c1 = norm(a1)^2;
c2 = norm(a2)^2;
slin = sqrt((norm(dely-F*delp)^2)/q); 
error1 = l*sqrt(slin^2*c1)*w1
error2 = l*sqrt(slin^2*c2)*w2
%
function yprime = lvrhs(t,y,p)
a = p(1); b = p(2); c = p(3); r = p(4);
yprime = [a*y(1)-b*y(1)*y(2); -r*y(2)+c*y(1)*y(2)];