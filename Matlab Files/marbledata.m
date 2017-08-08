%MARBLEDATA: MATLAB script M-file that defines data 
%on terminal velocities for marbles moving through 
%viscous fluids.
r = [.007 .008 .011 .013 .0175 .007 .008 .011 .013 .0175];
g = 9.81;
mu = [5 5 5 5 5 20 20 20 20 20];
m = [.003 .005 .013 .022 .054 .003 .005 .013 .022 .054]; %Intermediate variable, not used in the dimensional analysis
delrho = m./((4/3)*pi*r.^3)-[1427.1 1427.1 1427.1 1427.1 1427.1 1018.0 1018.0 1018.0 1018.0 1018.0];
v = [.026 .030 .046 .070 .076 .009 .010 .016 .019 .021]; 