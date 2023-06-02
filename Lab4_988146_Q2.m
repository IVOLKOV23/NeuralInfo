% Ivan Volkov, 988146
% 12/10/2022
% Lab 4 
% Q2
% part d
u1=0:0.05:1; % possible values for dimension 1
u2=0:0.05:1; % possible values for dimension 2

% final weights matrix
matrix = zeros(length(u1),length(u2));

% create initial weight pairs
[p, q] = meshgrid(u1, u2);
pairs = [p(:) q(:)];

% get the results from each pair
for i = 1:length(pairs)
    
    % get the results for each pair
    result = hebbian(pairs(i, :)'); 
    
    % create the matrix of values 
    x1 = find(u1 == pairs(i, 1));
    x2 = find(u2 == pairs(i, 2));
    matrix(x1, x2) = (result(1) + result(2) * 2);
    % each u1 value to plot on u2
    % u1 is x axis and u2 is y axis
end

% plotting
imagesc(u1,u2,matrix);
axis xy square;
colormap(gray);

% part e
[w,wd,ud,Q] = hebbian([0.05;0.1]);
[V,D] = eig(Q);

