function height2(x)

mother=[65 60 70 62 63 64 64 61 65 66];
father=[67 70 72 70 67 71 69 68 70 73];
son=[68 67 74 69 68 70 69 67 70 70];

F=[ones(size(son))' mother' father'];
p=F\son';
ssq = (norm(son'-F*p)^2)/7;

mu_x = [1 x(1) x(2)]*p
%For 95% confidence interval l=stut(7,0.95)=2.3646
l = 2.3646;
fx = [1 x(1) x(2)];
FL = (F'*F)\F';
a = FL'*fx';
c = norm(a)^2;
ssq = (norm(son'-F*p)^2)/7;
error = l*sqrt(ssq*c)

F=[ones(size(son))' mother' father'];
p=F\son'
%For 95% confidence interval l=2.3646
l = 2.3646;
V = inv(F'*F);
ssq = (norm(son'-F*p)^2)/7;
error_p = l*sqrt(ssq*diag(V))