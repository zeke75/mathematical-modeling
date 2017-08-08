%FISHERLINEAR1: Data and linear fit for the 
%Fisher-type PDE parameter estimation.
clear X Y Z;
load fisherdata;
h=.2; k=.1;
dex=1;
%The first row of u corresponds with t=0, the second with t=.2 etc. It's
%consistent with MATLAB's pdepe syntax to take the first index to be 
%associated with t.
for i=2:10          %space index
    for j=2:50      %time index
        X(dex) = udata(j,i);
        Y(dex) = (udata(j,i+1)-2*udata(j,i)+udata(j,i-1))/(k^2);
        Z(dex) = (udata(j+1,i)-udata(j-1,i))/(2*h);
        dex=dex+1;
    end
end
%
X = X';
M = [X X.^2 Y'];
p = M\Z';
r = p(1)
K = -r/p(2)
mu = p(3)
%
clear X Y Z
%
%Revised values consistent with the Crank-Nicolson finite difference scheme
for i=2:10          %space index
    for j=2:50      %time index
        X(dex) = (udata(j,i)+udata(j+1,i))/2;
        Y(dex) = (udata(j+1,i+1)-2*udata(j+1,i)+udata(j+1,i-1))/(2*k^2)+(udata(j,i+1)-2*udata(j,i)+udata(j,i-1))/(2*k^2);
        Z(dex) = (udata(j+1,i)-udata(j,i))/(h);
        dex=dex+1;
    end
end
%
X = X';
M = [X X.^2 Y'];
p = M\Z';
r = p(1)
K = -r/p(2)
mu = p(3)

