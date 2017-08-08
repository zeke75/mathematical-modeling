function chart=pendulum2(theta)
%PENDULUM2: MATLAB function M-file that takes as 
%input an initial angle theta and returns a chart 
%of times when the pendulum is at full amplitude
%and times when the pendulum is at full velocity.
g=9.81; l=1;
rhs = @(t,y) [y(2);-(g/l)*sin(y(1))];
options = odeset('Events',@subevents);
[t,y,te,ye,ie] = ode45(rhs,[0 5],[theta; 0],options);
chart = [te ye ie];
%
function [lookfor stop direction] = subevents(t,y)
lookfor = [y(1);y(2)];  %MATLAB looks for the event when either of these 
                        %expressions is 0
stop = [0;0];           %A stop value is specified for each event. 
direction = [0;0];      %We specify here that we do not care about direction 
                        %for either event.