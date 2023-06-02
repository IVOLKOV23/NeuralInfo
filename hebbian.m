function [w,wd,ud,Q] = hebbian(w)
% 431-336 Neurons Lab 4 - 2007
% [w,wd,ud,Q] = hebbian(w)
%   Input: w = column matrix of two initial weights
%   Output: w = final weights after training 1000 iterations
%           wd = weights over all iterations (in columns)
%           ud = inputs over all iterations (in columns)
%           Q = average correlation matrix of the inputs

% By David B Grayden, University of Melbourne, October 2007

rho = 0.01;     % Learning rate
numiter = 1000; % Number of iterations to run

wd = zeros(2,numiter);  % Store the weights over all iterations
ud = zeros(2,numiter);  % Store the inputs over all iterations
Q = zeros(2,2);

for i=1:numiter
    % Generate input data
    cor_val = randn(1) * 0.1 - 0.4;
    if (rand(1) < 0.5)
        u1 = randn(1) * 0.1 + 1.4;
        u2 = cor_val / u1;
        u = [u1 ; u2];
    else
        u2 = randn(1) * 0.1 + 1.4;
        u1 = cor_val / u2;
        u = [u1 ; u2];
    end
    
    % Add this input to the correlation matrix
    Q = Q + u * u';
    
    % Generate the output of the neuron
    y = w' * u;
    
    % The learning equation
    w = w + rho .* y .* u;

    % Check for going out of bounds
    if (w(1) > 1)
        w(1) = 1;
    elseif (w(1) < 0)
        w(1) = 0;
    end
    if (w(2) > 1)
        w(2) = 1;
    elseif (w(2) < 0)
        w(2) = 0;
    end
    
    % Save the history of weights and inputs
    wd(:,i) = w;
    ud(:,i) = u;
end

% Find the average correlation matrix
Q = Q / numiter;

% Plot the weights over the iterations
%plot(wd(1,:),wd(2,:)); axis([-0.1 1.1 -0.1 1.1]);
