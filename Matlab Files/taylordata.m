%TAYLORDATA: MATLAB script M-file that defines data
%for the first atomic explosion in New Mexico (code name Trinity, 
%July 16, 1945).  This is taken from p. 176 of Taylor's 
%paper "The formation of a blast wave by a very intense explosion II:
%the atomic explosion of 1945," in Proceedings of the Royal Society
%of London, Series A, vol. 201, no. 1065, pp. 175-186.
t = 1e-3*[.1 .24 .38 .52 .66 .80 .94 1.08 1.22 1.36 1.50 1.65 1.79 1.93 3.26 3.53 3.80 4.07 4.34 4.61 15.0 25.0 34.0 53.0 62.0]; %in seconds
R = [11.1 19.9 25.4 28.8 31.9 34.2 36.3 38.9 41.0 42.8 44.4 46.0 46.9 48.7 59.0 61.1 62.9 64.3 65.6 67.3 106.5 130.0 145.0 175.0 185.0]; %in meters
rho = 1.25; %kg/m^3
phi0 = 1.0316; %dimensionless