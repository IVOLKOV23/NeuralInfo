% Ivan Volkov, 988146
% Lab 1 
% Q2
clear 
close

% new random values each time the programme is run
rand('state', sum(100*clock));

% part a
N = 10000;            % number of spikes
fr = 10;              % firing rate
r_max = 50;           % max firing rate
s_max = 0;            % stimulus orientation that gives the max response
sigma_f = 15;         % width of response
dt = 0.0005;          % time step size

% stimulus orientation
t = [0:dt:(0.5-dt)];                                % time axis
stimulus = -40 + floor(t/0.1)*20;                   % orientation angle
rate = r_max*exp(-0.5*(stimulus/sigma_f).^2);       % rate of firing

% plot stimulus orientation vs time
figure(1);
subplot(5, 1, 1)
plot(t, stimulus);

% plot firing rate vs time
figure(1);
subplot(5, 1, 2)
plot(t, rate);

% part b
% initialisation
spikes = [];
spike_time = 0;

% spike train generation
while spike_time < 0.5
    
    % generate a random number
    x_rand = rand(1, 1);
    
    % generate a spike
    isi = -log(x_rand)/r_max;
    
    % update a spike time
    spike_time = spike_time + isi;
    
    % update firing rate and orientation angle
    % for a new time
    stimulus = -40 + floor(spike_time/0.1)*20;
    rate = r_max*exp(-0.5*(stimulus/sigma_f).^2);
    
    % determine a spike
    if (rate/r_max) < x_rand
        
        % update spikes
        spikes = [spikes];
        
    else
        
        % update spikes
        spikes = [spikes, spike_time];
        
        % plot the spike train
        figure(1);
        subplot(5, 1, 3)
        plot([spike_time spike_time], [0 1], 'b');
        xlim([0 0.5]);
        ylim([0 1.5]);
        hold on
    end
end

% plot the spike train
% figure(1);
% subplot(5, 1, 3)
% line(repmat(spikes,2,1),repmat([0;1],1,length(spikes)), 'color', 'k');
% xlim([0 0.5]);
% ylim([0 1.5]);

% part c
% initialisation
spikes50 = [];

for i = 1:50
    
    % initialisation
    spikes = [];
    spike_time = 0;
    
    % spike train generation
    while spike_time < 0.5
        
        % generate a random number
        x_rand = rand(1, 1);
        
        % generate a spike
        isi = -log(x_rand)/r_max;
        
        % update a spike time
        spike_time = spike_time + isi;
        
        % update firing rate and orientation angle
        % for a new time
        stimulus = -40 + floor(spike_time/0.1)*20;
        rate = r_max*exp(-0.5*(stimulus/sigma_f).^2);
        
        % determine a spike
        if (rate/r_max) < x_rand
            
            % update spikes
            spikes = [spikes];
            
        else
            
            % update spikes
            spikes = [spikes, spike_time];
            
            % plot the spike train
            figure(1);
            subplot(5, 1, 4)
            plot([spike_time spike_time], [i - 1, i], 'b');
            xlim([0 0.5]);
            hold on
        end
    end
    
    spikes50 = [spikes50 spikes];
    
end

% part d
num_bins = 500/10;

% plotting PSTH
figure(1);
subplot(5, 1, 5)
[n, xout] = hist(spikes50, num_bins);   % generate PSTH
bar(xout, n, 1);                        % plot the PSTH
axis([0 0.5 0 max(n)]);                 % set the axes
