%============== clean space ===========
clear ; close all; clc

%============== load data and define matrices ===========

fprintf('Importing data... \n');
data = load('data_nonLinear.txt');

fprintf('Creating matrices... \n');
X = data(:, 1:2);
y = data(:,3);

plotData(X, y);

% Put some labels
hold on;

% Labels and Legend
xlabel('Microchip Test 1')
ylabel('Microchip Test 2')

% Specified in plot order
legend('y = 1', 'y = 0')
hold off;

%============== regularized logistic regression ===========

% data points are not linearly separable
% will add polynomial features to data matrix to fit the data

fprintf('Adding polynomial features to matrix... \n')
X = mapFeature(X(:,1), X(:,2));

% Initialize fitting parameters
initial_theta = zeros(size(X, 2), 1);

% Set regularization parameter lambda
lambda = 1;

%============== optimise using fminunc ==============================

fprintf('Optimising theta vector... \n')

% Set Options
options = optimset('GradObj', 'on', 'MaxIter', 400);

% Optimize
[theta, J, exit_flag] = ...
	fminunc(@(t)(costFunction(t, X, y, lambda)), initial_theta, options);

%============== plot boundaries ==============================

fprintf('Plotting boundaries according to theta and lambda... \n')
% Plot Boundary
plotBoundary(theta, X, y);
hold on;
title(sprintf('lambda = %g', lambda))

% Labels and Legend
xlabel('Microchip Test 1')
ylabel('Microchip Test 2')

legend('y = 1', 'y = 0', 'Decision boundary')
hold off;

%============== Accuracy and predictions ==============================

fprintf('Calculating prediction accuracy... \n')

p = predict(theta, X);
fprintf('Train Accuracy: %f\n', mean(double(p == y)) * 100);

fprintf('\n')
test1 = input("Input test 1 score >>");
test2 = input("Input test 2 score >>");
input = mapFeature(test1, test2);

prob = sigmoid(input * theta);

fprintf(['Based on these scores, we predict and QA pass probability of %f\n'], prob);


