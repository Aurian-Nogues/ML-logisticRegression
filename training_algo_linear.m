%============== clean space ===========
clear ; close all; clc

%============== load data and define matrices ===========

fprintf('Importing data... \n');
data = load('data_linear.txt');
X = data(:, 1:2);
y = data(:,3);


%============== plot data ==============================
fprintf('Plotting data \n');
plotData(X,y);
hold on;
% Labels and Legend
xlabel('Exam 1 score')
ylabel('Exam 2 score')
legend('Admitted', 'Not admitted')
hold off;

%============== add interecept parameter ==============================

[m, n] = size(X);

% Add intercept term to X
X = [ones(m, 1) X];

% ========== single use of cost function, not used here==============
% Initialize fitting parameters
initial_theta = zeros(n + 1, 1);

% fprintf('Computing initial cost and gradient... \n');
% % Compute and display initial cost and gradient
% [cost, grad] = costFunction(initial_theta, X, y, lambda);

%============== optimising using fminunc ==============================

%  Set options for fminunc
options = optimset('GradObj', 'on', 'MaxIter', 400);

% set lambda to 0: because hypothesis function is low level polynomial
% no need for regularization so lambda = 0
lambda = 0;

[theta, cost] = ...
	fminunc(@(t)(costFunction(t, X, y, lambda)), initial_theta, options);

%============== plot boundaries ==============================

fprintf('Plotting decision boundary... \n')

% Plot Boundary
plotBoundary(theta, X, y);

% Put some labels 
hold on;
% Labels and Legend
xlabel('Exam 1 score')
ylabel('Exam 2 score')

% Specified in plot order
legend('Admitted', 'Not admitted')
hold off;

%============== predictions and accuracy ==============================

% Compute accuracy on our training set
p = predict(theta, X);
fprintf('Train Accuracy: %f\n', mean(double(p == y)) * 100);

fprintf('\n')
test1 = input("Input test 1 score >>");
test2 = input("Input test 2 score >>");

prob = sigmoid([1 test1 test2] * theta);

fprintf(['Based on these scores, we predict and admissibility probability of %f\n'], prob);
