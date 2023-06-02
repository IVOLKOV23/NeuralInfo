function spikes = auditory_nerve(stimulus, dt)
% spikes = auditory_nerve(stimulus, dt)
%   Simulates a single auditory nerve fibre, creating a sequence of spikes
%   every dt seconds.
%   INPUT
%       stimulus: sampled input stimulus, such as a sine wave
%       dt: sampling period in seconds
%   OUTPUT
%       spikes: array of spike times in seconds

% sanity checks
if (dt > 1/4000)
    error('dt must to be no more than 0.00025');
end

beta = 0.05;
s = @(x) (300 .* (2./(1+exp(-beta.*(x)))-1)) .* (0.1*(x < -26) + (x > 26));

bandwidth = 1/dt/2;

% Set up a filter
th_freqs = [0 700 1800 2500 bandwidth]/bandwidth;
th_filt  = [0   0    1    0    0];

b = [-0.0002,-0.0001,0.0002,0.0005,0.0001,-0.0006,-0.0004,0.0007,0.0009,-0.0004,-0.0015,-0.0021,-0.0031,-0.0011,0.0061,0.0083,-0.0056,-0.0171,0.0077,0.0533,0.0435,-0.0528,-0.1363,-0.079,0.0883,0.1807,0.0883,-0.079,-0.1363,-0.0528,0.0435,0.0533,0.0077,-0.0171,-0.0056,0.0083,0.0061,-0.0011,-0.0031,-0.0021,-0.0015,-0.0004,0.0009,0.0007,-0.0004,-0.0006,0.0001,0.0005,0.0002,-0.0001,-0.0002];

filt_stim = filter(b, 1, stimulus);
rate = s(filt_stim) + 30;
spikes = (find(rand(1,length(rate)) < rate .* dt)-1) * dt;
