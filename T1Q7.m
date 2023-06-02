% potassium
Gk = 24.3;
t = 0:1:100;
n = 0.891 - 0.376.*exp(-t./1.7);
gk = Gk.*n.^4;
plot(t, gk);
xlabel('Time (ms)');
ylabel('Conductance (mS)');
title('Potassium conductance');

% sodium
Gna = 70.7;
t = 0:0.5:5;
m = 0.963*(1 - exp(-t./0.252));
h = 0.605.*exp(-t./0.84);
gna = Gna.*h.*m.^3;
plot(t, gna);
xlabel('Time (ms)');
ylabel('Conductance (mS)');
title('Sodium conductance');