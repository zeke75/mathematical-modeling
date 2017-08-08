% Problem3

function distance=a8_3(theta)

g=9.81; b=0.065; h0=0.18; v0=13.686431338562331;
rhs = @(t,y) [y(2);-b*sqrt(y(2)^2+y(4)^2)*y(2);y(4);-g-b*sqrt(y(2)^2+y(4)^2)*y(4)];
options = odeset('Events',@subevents);
[t,y,te,ye,ie] = ode45(rhs,[0 5],[0;v0*cos(pi/180*theta);h0;v0*sin(pi/180*theta)],options);
distance = ye(1);
%
function [lookfor stop direction] = subevents(t,y)
lookfor = y(3); %MATLAB looks for the event when this expression is 0
stop = 1;       %stop = 1 tells MATLAB to stop when the event is located
                %stop = 0 tells MATLAB to continue solving when the event 
                %is located.
direction = 0; %Specifies that lookfor (i.e., y(1) here) should be 
                %decreasing.  Can be +1 for increasing or 0 for
                %unspecified.