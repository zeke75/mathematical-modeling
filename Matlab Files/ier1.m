%IER1: MATLAB script M-file that carries out a regression fit
%for identifying an elementary reaction
%
%Data (Typically, you would want much more data)
N = [.1 .1 .2]'; %Concentrations of NO
H = [.1 .2 .1]'; %Concentrations of H_2
R = 1e-3*[1.23 2.46 4.92]'; %Observed reaction rates
%
%The fit
F = [ones(size(R)) log(N) log(H)];
p = F\log(R);
a = p(2)
b = p(3)
k = exp(p(1))/2