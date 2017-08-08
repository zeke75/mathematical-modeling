%Problem 4

l = [1.93 1.93 1.94 .79 .79 .79 .79 2.4 2.01 2.01 6.84 6.84]; %in meters
P = [2.791 2.758 2.863 1.769 1.997 1.819 1.797 3.075 2.825 2.872 5.099 5.066]; %in seconds
a = [1.4 .66 2.68 .79 1.57 1.14 .53 1.03 1 2.24 1.14 1.14]; %in meters, length measured horizontally from one extreme of oscillation to the other
theta = asin(a./(2*l)); %theta in radians, computed from a and l
g=9.81;

pi1 = P.*sqrt(g./l);
pi2 = theta;
p = polyfit(pi2,pi1,1)
subplot(2,1,1)
plot(pi2,pi1,'o',pi2,p(1)*pi2+p(2))

%Compare model with exact solution
l=1;
theta=0:.05:pi/2;
modelP = p(1)*theta.*sqrt(l/g)+p(2)*sqrt(l/g);
exactP = 4*sqrt(l/g)*ellipke((sin(theta/2)).^2);
subplot(2,1,2)
plot(theta,modelP,'o',theta,exactP,'*')

