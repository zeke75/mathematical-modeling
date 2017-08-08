% Problem 4a

function lvnonlinearfit
angle=5:5:85;
distance=[4.37 5.23 6.95 7.84 8.17 8.69 8.81 8.99 8.95 8.83 8.19 7.84 7.12 6.38 5.08 3.34 2.13];
guess = [0.065; 13.686431338562331];
[p,error]=fminsearch(@lverr, guess);
b = p(1)
v0 = p(2)
s = sqrt(error/15) 
pause
%
function error = lverr(p)
angle=5:5:85;
distance=[4.37 5.23 6.95 7.84 8.17 8.69 8.81 8.99 8.95 8.83 8.19 7.84 7.12 6.38 5.08 3.34 2.13];
error = norm([a8_3(5) a8_3(10) a8_3(15) a8_3(20) a8_3(25) a8_3(30) a8_3(35) ...
    a8_3(40) a8_3(45) a8_3(50) a8_3(55) a8_3(60) a8_3(65) a8_3(70) a8_3(75) ...
    a8_3(80) a8_3(85)]-distance);

function distance=a8_3(theta)

g=9.81; h0=0.18;
rhs = @(t,y) [y(2);-guess(1)*sqrt(y(2)^2+y(4)^2)*y(2);y(4);-g-guess(1)*sqrt(y(2)^2+y(4)^2)*y(4)];
options = odeset('Events',@subevents);
[t,y,te,ye,ie] = ode45(rhs,[0 5],[0;guess(2)*cos(pi/180*theta);h0;guess(2)*sin(pi/180*theta)],options);
distance = ye(1);
%
function [lookfor stop direction] = subevents(t,y)
lookfor = y(3); 
stop = 1;    
direction = 0; 