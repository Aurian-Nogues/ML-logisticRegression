function p = predict(theta, X)
%returns prediction 0 or 1 using learned logistic regression theta

m = size(X, 1); % Number of training examples
p = zeros(m, 1);
p = sigmoid(X * theta) >= 0.5;

end

%==================== test cases ===================

% X = [1 1 ; 1 2.5 ; 1 3 ; 1 4];
% theta = [-3.5 ; 1.3];

% predict(theta, X)
%ans =

%   0
%   0
%   1
%   1

 %=====================================================





