% Ivan Volkov
% 988146
% 03/09/2022
% Lab 2, Q3

% part a
% stimulation parameters
dt = 0.0001;                % step size in seconds
lentime = 1;                % duration of simulation in seconds
ts = 0:dt:lentime;          % each step of the full simulation
lensim = length(ts);        % number of steps in the simulation

% stimulus parameters
rng('shuffle');
rate = 100;                                  % mean input rate
spikes = rand(1, lensim) < (dt * rate);      % input spike train

% plotting
% rate
figure(1);
subplot(5, 1, 1);
yline(rate);

% spike train
figure(1);
subplot(5, 1, 2);

% x-coordinates
[~, x_coor] = find(spikes==1);
x_coor = dt*x_coor;
xline(x_coor);

% part b
% membrane parameters
a = 4.0;                        % mV step in membrane voltage for each input
tau = 0.02;                     % membrane time constant in seconds
threshold = 10;                 % firing threshold
outspikes = zeros(1,lensim);        
v = zeros(1,lensim);            % membrane potential

% membrane potential
index = 1;
for t=dt:dt:lentime
    
    % Decay the membrane potential
    v(index+1) = exp(-dt/tau)*v(index);
    index = index + 1;
    
    % Is there an input spike in this time?
    if (spikes(index))
        v(index) = a + v(index);
    end
    
    % Is voltage big enough to fire?
    if v(index) > threshold
        outspikes(index) = 1;
        v(index) = 0;
    end
    
end

% plotting
figure(1);
subplot(5, 1, 3);
plot(ts, v);

% part c
% plotting
figure(1);
subplot(5, 1, 4);
[~, x_coor] = find(outspikes==1);
x_coor = dt*x_coor;
xline(x_coor);
xlim([0 1]);
