% Ivan Volkov, 988146
% Lab 1 
% Q1
clear 
close

% new random values each time the programme is run
rand('state', sum(100*clock));

% part a
N = 100000;      % number of spikes
lambda = 10;        % firing rate

% spikes
isi = -log(rand(1, N))/lambda;

% plotting histogram
t = 0:0.02:0.98;
h = histc(isi, t);
bar(t, h, 'BarWidth', 1);

% plotting distribution
hold on
y_analytical = N*0.02*(lambda*exp(-lambda*t));
plot(t, y_analytical);
xlabel("Time (s)");
ylabel("Spike Frequency");
legend("Generated ISI", "Analytical ISI");

% part c
% generated ISI
isi_mean = mean(isi); 
isi_var = var(isi);
isi_coeff = sqrt(isi_var)/isi_mean;

% analytical ISI
dist_mean = 1/lambda;
dist_var = 1/lambda^2;
dist_coeff = sqrt(dist_var)/dist_mean;