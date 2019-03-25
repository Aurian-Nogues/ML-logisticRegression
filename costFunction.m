function [J, grad] = costFunction(theta, X, y, lambda)
%computes Cost J and grad in a regularized cost funtion with regularization parameter lambda

m = length(y); % number of training examples
J = 0;
grad = zeros(size(theta));

%h(x) = hypothesis_vector = g(theta'X) %'
hyp_vct = sigmoid(X * theta); %

temp_theta = theta;
temp_theta(1) = 0; % regularization sums theta square ignoring intercept theta (theta(1))

J = 1/m * sum(-y'*log(hyp_vct) - (1-y')*log(1-hyp_vct)) + (lambda/(2*m)) * sum((temp_theta.^2)) ;


% prodcut of vectors already takes care of summation so no need to add
grad = 1/m * X'*(hyp_vct - y) + (lambda/m) * (temp_theta); %'

end

%==================== test cases ===================

% X = [ones(3,1) magic(3)];
% y = [1 0 1]';
% theta = [-2 -1 1 2]';

%[j g] = costFunction(theta, X, y, 4)

% results
%j =  8.6832
%g =

%   0.31722
%  -0.46102
%   2.98146
%   4.90454

 %=====================================================