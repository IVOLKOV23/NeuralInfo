% Ivan Volkov, 988146
% 10/10/2022
% Lab 4 
% Q1
clear all
close all

a = 0.7;
b = 0.8;
Iapp = 1.5; % applied current injection
duration = 200; % duration of simulation in msec
tInit = [0 duration];
xInit=[-1.2; -0.625];
[t, x] = ode23('FN', tInit, xInit, [], Iapp);
% plot membrane potential
figure(1)
plot(t, x(:,1));
axis([0 duration -2.5 2.5]);
xlabel('time (ms)');
ylabel('voltage (mV)');
% plot phase plane
figure(2)
V = -2.5:0.01:2.5;
plot(V, V - V.^3/3 + Iapp);
hold on
plot(V, (V+a)/b, 'k');
axis([-2.5 2.5 -2.5 2.5])
plot(x(:,1), x(:,2), 'r');

% intersection point
syms v
eqn = v - v.^3/3 + Iapp == (v+a)/b;
v_out = vpasolve(eqn, v);
w_out = (v_out+a)/b;