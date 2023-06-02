% Ivan Volkov, 988146
% Lab 3 
% Q1
clear 
close

% part a
Fs = 10000;                             % Sampling rate for the stimuli
dt = 1/Fs;                              % Corresponding sampling period
f = 100;                                % Stimulus frequency in Hz
t = 0:dt:1000;                             % Stimulation time in seconds
index = 1;

% create spikes
for i = f:100:4000
    stimulus = 100*sin(2*pi*i*t);                   % Pure tone stimulus
    spikes = auditory_nerve(stimulus, dt);          % spike generation
    spikeNum(index) = length(spikes);               % number of spikes generated
    index = index + 1;
end

% plotting
figure(1);
bar([100:100:4000], spikeNum);
xlabel('Stimulus freq (Hz)');
ylabel('Number of spikes');

% part b
stimulus = zeros(1, length(t));
spikes = auditory_nerve(stimulus, dt);          % spike generation
spontaneousRate = length(spikes)/max(t);

% part c
[maxNum, indx] = max(spikeNum);
charFreq = indx*100;
for j = 1:1:1000
    stimulus = j*sin(2*pi*charFreq*t);
    spikes = auditory_nerve(stimulus, dt); 
    spikeRate(j) = length(spikes)/max(t);
end

% plotting
figure(2);
plot([1:1:1000], spikeRate);
xlabel('Stimulus Amplitude');
ylabel('Firing rate');