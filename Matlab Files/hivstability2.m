%HIVSTABILITY2: MATLAB script M-file that locates
%equilibrium points for a simple model of HIV 
%infection, computes the Jacobian matrix for each 
%equilibrium point, and finds the eigenvalues of 
%each Jacobian matrix.
syms y1 y2 y3 a b c k N r;
y = [y1, y2, y3];
f=[a-b*y1-c*y1*y3, c*y1*y3-k*y2,k*N*y2-r*y3];
[ye1 ye2 ye3] = solve(f(1),f(2),f(3))
J = jacobian(f,y)
a=125.5; b=.1255; c=1.4476e-3;k=.4537;N=10;r=5.9640;
for dex=1:length(ye1)
y1 = eval(ye1(dex)) 
y2 = eval(ye2(dex)) 
y3 = eval(ye3(dex))
A = subs(J)
lambda = eig(A)
end


