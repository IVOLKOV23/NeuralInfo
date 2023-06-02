function xdot=FN(t, x, flag, I);
% Variables...
V=x(1); W=x(2);
phi = 0.08;
a = 0.7;
b = 0.8;
%
xdot(1,1)= V - V^3/3 - W + I;
xdot(2,1)= phi * (V + a - b* W);
% End FN.m