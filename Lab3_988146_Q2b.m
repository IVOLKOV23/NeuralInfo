% Ivan Volkov, 988146
% Lab 3 
% Q2, part b
clear 
close

close all
duration = 100;                                 % duration of simulation in msec
Iapp = 100.0;                                     % applied current injection
tInit = [0 duration];
xInit=[-65; 0.317];
[t, x] = ode23('HHFS', tInit, xInit, [], Iapp);
plot(t, x(:,1));
axis([0 duration -80 60]);
xlabel('time (ms)');
ylabel('voltage (mV)');