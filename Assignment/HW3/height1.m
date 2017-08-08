%Problem 1
function height1(x)

mother=[65 60 70 62 63 64 64 61 65 66];
father=[67 70 72 70 67 71 69 68 70 73];
son=[68 67 74 69 68 70 69 67 70 70];
midheight=(father + 1.08*mother)/2;

%1a
F=[ones(size(son))' midheight'];
p=F\son';
ssq = (norm(son'-F*p)^2)/8

%1b
mu_x = [1 x]*p
%For 95% confidence interval l=stut(8,0.95)=2.3060
l = 2.3060;
fx = [1 x];
FL = (F'*F)\F';
a = FL'*fx';
c = norm(a)^2;
error_mu = l*sqrt(ssq*c)

%1c
p=F\son'
%For 95% confidence interval l=stut(8,0.95)=2.3060
l = 2.3060;
V = inv(F'*F);
error_p = l*sqrt(ssq*diag(V))