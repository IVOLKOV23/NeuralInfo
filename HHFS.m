function xdot=HHFS(t, x, flag, Iapp);
% Variables...
V=x(1); n=x(2);
% Constant parameters...
% Just set them here...
VNa=50; gNa=120;
VK=-77; gK=36;
VL=-54.4; gL=0.3;
C=1;
%
taum=1/(0.1*(V+40)/(1-exp(-(V+40)/10))+4*exp(-(V+65)/18));
minf=(0.1*(V+40)/(1-exp(-(V+40)/10)))*taum;
tauh=1/(0.07*exp(-(V+65)/20)+(1/(1+exp(-(V+35)/10))));
hinf=0.07*exp(-(V+65)/20)*tauh;
taun=1/(0.01*(V+55)/(1-exp(-(V+55)/10))+0.125*exp(-(V+65)/80));
ninf=(0.01*(V+55)/(1-exp(-(V+55)/10)))*taun;
%
xdot(1,1)=(Iapp - gNa*minf^3*hinf*(V-VNa) - gK*(V-VK)*n^4 - gL*(V-VL))/C;
xdot(2,1)=-(n - ninf)/taun;
% End HHFS.m