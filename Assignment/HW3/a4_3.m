%Problem 3
x1=4:14;
y1=[4.26 5.68 7.24 4.82 6.95 8.81 8.04 8.33 10.84 7.58 9.96];
x2=4:14;
y2=[3.10 4.74 6.13 7.26 8.14 8.77 9.14 9.26 9.13 8.74 8.10];
x3=4:14;
y3=[5.39 5.73 6.08 6.42 6.77 7.11 7.46 7.81 8.15 12.74 8.84];
x4=[8*ones([1 10]) 19];
y4=[6.58 5.76 7.71 8.84 8.47 7.04 5.25 5.56 7.91 6.89 12.50];

p1=polyfit(x1,y1,1);
p1=[p1(2);p1(1)];
F1=[ones(size(y1))' x1'];
M1=F1*((F1'*F1)\F1');
s = sqrt(norm(y1'-F1*p1)^2/9);
r = (y1'-F1*p1)./(s*sqrt(1-diag(M1)))
subplot(2,2,1);
plot(F1*p1,r,'o',F1*p1,-ones([1 length(F1*p1)]),'r',F1*p1,ones([1 length(F1*p1)]),'r')
axis([4.5 10.5 -2 2]);
title('Standardized residuals vs. \mu_k','FontSize',15)
xlabel('\mu_k = (Fp)_k'); ylabel('Standardized residuals r_k')

p2=polyfit(x2,y2,1);
p2=[p2(2);p2(1)];
F2=[ones(size(y2))' x2'];
M2=F2*((F2'*F2)\F2');
s = sqrt(norm(y2'-F2*p2)^2/9);
r = (y2'-F2*p2)./(s*sqrt(1-diag(M2)))
subplot(2,2,2);
plot(F2*p2,r,'o',F2*p2,-ones([1 length(F2*p2)]),'r',F2*p2,ones([1 length(F2*p2)]),'r')
axis([4.5 10.5 -2 2]);
title('Standardized residuals vs. \mu_k','FontSize',15)
xlabel('\mu_k = (Fp)_k'); ylabel('Standardized residuals r_k');

p3=polyfit(x3,y3,1);
p3=[p3(2);p3(1)];
F3=[ones(size(y3))' x3'];
M3=F3*((F3'*F3)\F3');
s = sqrt(norm(y3'-F3*p3)^2/9);
r = (y3'-F3*p3)./(s*sqrt(1-diag(M3)))
subplot(2,2,3);
plot(F3*p3,r,'o',F3*p3,-ones([1 length(F3*p3)]),'r',F3*p3,ones([1 length(F3*p3)]),'r')
axis([4.5 10.5 -3 3]);
title('Standardized residuals vs. \mu_k','FontSize',15)
xlabel('\mu_k = (Fp)_k'); ylabel('Standardized residuals r_k');

p4=polyfit(x4,y4,1);
p4=[p4(2);p4(1)];
F4=[ones(size(y4))' x4'];
M4=F4*((F4'*F4)\F4');
s = sqrt(norm(y4'-F4*p4)^2/9);
r = (y4'-F4*p4)./(s*sqrt(1-diag(M4)))
subplot(2,2,4);
plot(F4*p4,r,'o',F4*p4,-ones([1 length(F4*p4)]),'r',F4*p4,ones([1 length(F4*p4)]),'r')
axis([6.5 13 -2 2]);
title('Standardized residuals vs. \mu_k','FontSize',15)
xlabel('\mu_k = (Fp)_k'); ylabel('Standardized residuals r_k');