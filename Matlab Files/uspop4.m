%USPOP4: MATLAB script M-file giving an example of 
%how to compute derivatives symbolically in MATLAB.
%
%Method 1 (out of date)
y_r=diff('y0*K/(y0+(K-y0)*exp(-r*t))','r')
y_r=simple(y_r)
pretty(y_r)
pause
%Method 2
syms t r K y0;
y_r=diff(y0*K/(y0+(K-y0)*exp(-r*t)),r)
y_r=simple(y_r)
pretty(y_r)