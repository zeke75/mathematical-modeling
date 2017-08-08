function period=pendulum1(theta)
%PENDULUM1: MATLAB function M-file that takes as 
%input an initial angle theta and returns the 
%period of a simple pendulum released from rest
%at angle theta.
g=9.81; l=1;
rhs = @(t,y) [y(2);-(g/l)*sin(y(1))];
options = odeset('Events',@subevents);
[t,y,te,ye,ie] = ode45(rhs,[0 5],[theta; 0],options);
%Interpretations
% te = time at which the event occurs
% ye = values of y(1) and y(2) when the event occurs
% ie = in the case of multiple events, ie designates 
% which event has occurred. See pendulum2.m for an 
% example.
period = 4*te;
%
function [lookfor stop direction] = subevents(t,y)
lookfor = y(1); %MATLAB looks for the event when this expression is 0
stop = 1;       %stop = 1 tells MATLAB to stop when the event is located
                %stop = 0 tells MATLAB to continue solving when the event 
                %is located.
direction = -1; %Specifies that lookfor (i.e., y(1) here) should be 
                %decreasing.  Can be +1 for increasing or 0 for
                %unspecified.